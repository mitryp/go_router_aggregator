import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

/// Reads an `output` option from build.yaml (defaults to "routes.g.dart")
/// and uses that for buildExtensions and writing the file.
Builder aggregateAppRoutes(BuilderOptions options) =>
    AggregateAppRoutesBuilder(options);

class AggregateAppRoutesBuilder implements Builder {
  static const _defaultPath = 'routes.g.dart';
  static final _routesPattern =
      RegExp(r'List\s*<\s*RouteBase\s*>\s*get\s*\$appRoutes');
  static final _glob = Glob('**/*.g.dart');

  /// e.g. "navigation/routes.g.dart" or just "routes.g.dart"
  final String outputPath;

  AggregateAppRoutesBuilder(BuilderOptions options)
      : outputPath = options.config['output'] as String? ?? _defaultPath;

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [outputPath],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final idsStream =
        buildStep.findAssets(_glob).where((id) => id.path.startsWith('lib/'));

    final prefixes = <String>{};
    final buffer = StringBuffer(
      '''// GENERATED by go_router_aggregator - do NOT edit by hand - contents will be overridden
// ignore_for_file: type=lint
import 'package:go_router/go_router.dart';\n
''',
    );
    final spreads = StringBuffer();

    await for (final id in idsStream) {
      if (id.path.endsWith(outputPath)) {
        continue;
      }

      final content = await buildStep.readAsString(id);

      if (!_routesPattern.hasMatch(content)) {
        continue;
      }

      // create the import prefix
      var fileName = path.basenameWithoutExtension(id.path);
      fileName = fileName.substring(0, fileName.length - 2);
      var count = 0;
      String prefix;
      do {
        prefix = '_$fileName${count++}';
      } while (prefixes.contains(prefix));

      // write the input statement to the buffer directly

      // turn lib/foo/bar.g.dart into foo/bar.dart
      final sourceFilePath = id.path.substring(4, id.path.length - 7) + '.dart';
      buffer.writeln(
        "import 'package:${id.package}/$sourceFilePath' as $prefix;",
      );

      // save the prefix to avoid duplicates
      prefixes.add(prefix);

      // write the spread operator entry into its buffer
      spreads.writeln('  ...$prefix.\$appRoutes,');
    }

    if (spreads.isEmpty) {
      return;
    }

    // write the aggregated routes collection
    final spreadsStr = spreads.toString();
    buffer
      ..writeln('\nList<RouteBase> get \$aggregatedRoutes => [')
      ..writeln(
        spreadsStr.substring(0, spreadsStr.length - 1),
      ) // remove the last newline
      ..writeln('];');

    // write the output to the configured path
    final outId = AssetId(
      buildStep.inputId.package,
      'lib/${outputPath.trim()}',
    );

    await buildStep.writeAsString(outId, buffer.toString());
  }
}

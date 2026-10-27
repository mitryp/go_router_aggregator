# 2.1.0

27.10.2026

* Fixed route libraries being skipped when their file name ended with the output file name
  (e.g. `app_routes.dart` with the default `routes.g.dart` output).
* Fixed invalid import prefixes generated for file names that are not valid Dart identifiers
  (e.g. `my-page.dart`).
* Fixed a build failure when the `output` option contained surrounding whitespace.
  Invalid `output` values (absolute, outside of `lib/`, starting with `lib/` or not ending with `.dart`)
  are now reported with a descriptive error.
* The builder now explicitly runs after `go_router_builder` instead of relying on the builder order.
* Routes are now ordered by their file path, and import prefixes are derived from the full path,
  so the output no longer changes between builds or when unrelated route files are added.
* The output is now formatted with `dart format` for the package's language version.
* The output is now always generated, with an empty list when there are no routes,
  so the import of it doesn't break.
* Routes are now detected from the `go_router_builder` output directly rather than by reading every `.g.dart`
  file in `lib/`, so the aggregation only re-runs when a library with routes is added or removed.
  This also works with custom `source_gen` output locations.
* Raised the minimum Dart SDK version to 3.7.0, as required by `build` 4.

# 2.0.0

18.12.2025

* Removed the `build <= 2.5.0` version constraint workaround
  for [#170832](https://github.com/flutter/flutter/issues/170832)
  thanks to [karolgajda-techsquare](https://github.com/karolgajda-techsquare).
* Updated package dependencies.

# 1.0.2

12.08.2025

* Fixed a rare bug when the generated file could contain imports to removed source files,
  resulting in compile-time errors.

  This occurred when build_runner failed to remove a `.g.` file after the source file was
  abruptly removed, for example, by version control.

# 1.0.1

05.07.2025

* Updated the package description at pub.dev.

# 1.0.0

05.07.2025

* Initial package release.

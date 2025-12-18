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

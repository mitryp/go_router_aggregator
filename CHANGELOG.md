# 1.0.2

* Fixed a rare bug when the generated file could contain imports to removed source files, 
  resulting in compile-time errors.

  This occurred when build_runner failed to remove a `.g.` file after the source file was 
  abruptly removed, for example, by version control.

# 1.0.1

* Updated the package description at pub.dev.

# 1.0.0

* Initial package release.

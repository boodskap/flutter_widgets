# Flutter Widgets

Collection of reusable flutter widgets which can be used by anyone

# Creation

###### Command Line
```shell script
cd packages
flutter create --org io.boodskap --template package your_widget_name
```
# Usage

You can include a package into your application **pubspec.yaml** like below

```yaml
dependencies:
  your_widget_name: 1.0.0
```
# Gudelines

**Each and every** new widget must be created using the below guidelines

- Under **packages** folder
  - flutter create --org **io.boodskap** --template **package** your_widget_name
  - In the new widget's pubspec.yaml file
    - set the **version:1.0.0**
  - Edit the **CHANGELOG.md** and change the version to 1.0.0 and give some description
  - Copy paste the **GIT IGNORE** below section content to the **.gitignore** file
  - Copy paste the **README.md** below section content to the **README.md** file
  - Copy paste the **LICENSE** below section content to the **LICENSE** file
  - Create a fullter project called **example** under this widget project
    - In the **example** folder
      - Copy paste the **GIT IGNORE** below section content to the **.gitignore** file
      - **flutter create --org io.boodskap.your_widget_name example**
      - implement a minimum example of this widget in **lib/main**.dart file
  - Once your have finished creating the widget, after pushing changes you must create a git tag matching the exact version name
    - Example
      - git tag 1.0.0
      - git push --tags


# README.md

```properties
## Features

## Getting started

## Usage

## Additional information
```

# LICENSE

```java
/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>
 */
```

# GIT IGNORE
```text
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

# Do not remove or rename entries in this file, only add new ones
# See https://github.com/flutter/flutter/issues/128635 for more context.

# Miscellaneous
*.lock

# Visual Studio Code related
.classpath
.project
.settings/
.vscode/*

# Flutter repo-specific
/bin/cache/
/bin/internal/bootstrap.bat
/bin/internal/bootstrap.sh
/bin/mingit/
/dev/benchmarks/mega_gallery/
/dev/bots/.recipe_deps
/dev/bots/android_tools/
/dev/devicelab/ABresults*.json
/dev/docs/doc/
/dev/docs/api_docs.zip
/dev/docs/flutter.docs.zip
/dev/docs/lib/
/dev/docs/pubspec.yaml
/dev/integration_tests/**/xcuserdata
/dev/integration_tests/**/Pods
/packages/flutter/coverage/
version
analysis_benchmark.json

# packages file containing multi-root paths
.packages.generated

# Flutter/Dart/Pub related
**/generated_plugin_registrant.dart
.pub-preload-cache/
build/
flutter_*.png
linked_*.ds
unlinked.ds
unlinked_spec.ds

# Android related
**/android/**/gradle-wrapper.jar
.gradle/
**/android/captures/
**/android/gradlew
**/android/gradlew.bat
**/android/local.properties
**/android/**/GeneratedPluginRegistrant.java
**/android/key.properties
*.jks

# iOS/XCode related
**/ios/**/*.mode1v3
**/ios/**/*.mode2v3
**/ios/**/*.moved-aside
**/ios/**/*.pbxuser
**/ios/**/*.perspectivev3
**/ios/**/*sync/
**/ios/**/.sconsign.dblite
**/ios/**/.tags*
**/ios/**/.vagrant/
**/ios/**/DerivedData/
**/ios/**/Icon?
**/ios/**/Pods/
**/ios/**/.symlinks/
**/ios/**/profile
**/ios/**/xcuserdata
**/ios/.generated/
**/ios/Flutter/App.framework
**/ios/Flutter/Flutter.framework
**/ios/Flutter/Flutter.podspec
**/ios/Flutter/Generated.xcconfig
**/ios/Flutter/ephemeral
**/ios/Flutter/app.flx
**/ios/Flutter/app.zip
**/ios/Flutter/flutter_assets/
**/ios/Flutter/flutter_export_environment.sh
**/ios/ServiceDefinitions.json
**/ios/Runner/GeneratedPluginRegistrant.*

# macOS
**/Flutter/ephemeral/
**/Pods/
**/macos/Flutter/GeneratedPluginRegistrant.swift
**/macos/Flutter/ephemeral
**/xcuserdata/

# Windows
**/windows/flutter/generated_plugin_registrant.cc
**/windows/flutter/generated_plugin_registrant.h
**/windows/flutter/generated_plugins.cmake

# Linux
**/linux/flutter/generated_plugin_registrant.cc
**/linux/flutter/generated_plugin_registrant.h
**/linux/flutter/generated_plugins.cmake

# Coverage
coverage/

# Exceptions to above rules.
!**/ios/**/default.mode1v3
!**/ios/**/default.mode2v3
!**/ios/**/default.pbxuser
!**/ios/**/default.perspectivev3
!/packages/flutter_tools/test/data/dart_dependencies_test/**/.packages
!/dev/ci/**/Gemfile.lock
!.vscode/settings.json

*.metadata
```


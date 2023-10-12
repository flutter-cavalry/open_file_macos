# open_file_macos

Flutter plugin for macOS to open files or view files in Finder.

## Usage

```dart
import 'package:open_file_macos/open_file_macos.dart';

final _openFileMacosPlugin = OpenFileMacos();
// Open a file.
await _openFileMacosPlugin.open('path/to/a/file');
// Open a file in Finder.
await _openFileMacosPlugin.open('path/to/a/file', viewInFinder: true);
```

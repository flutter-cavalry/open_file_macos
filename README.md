# open_file_macos

[![pub package](https://img.shields.io/pub/v/open_file_macos.svg)](https://pub.dev/packages/open_file_macos)

A flutter plugin for macOS to open files or view files in Finder.

## Usage

```dart
import 'package:open_file_macos/open_file_macos.dart';

final _openFileMacosPlugin = OpenFileMacos();
// Open a file.
await _openFileMacosPlugin.open('path/to/a/file');
// Show a path in Finder.
await _openFileMacosPlugin.open('path/to/a/file', viewInFinder: true);
// Path can be a file URL.
await _openFileMacosPlugin.open('file:///path/to/a/file', isFileURL: true);
```

## Windows Support?

As the package name suggests, this package only focuses on a clean implementation on macOS. 

To open files on other platforms, you can find plenty of alternatives on pub.dev.

To view files in explorer on Windows:

```dart
await Process.run('explorer.exe', ['/select,$path']);
```

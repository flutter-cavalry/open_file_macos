import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_file_macos_platform_interface.dart';

/// An implementation of [OpenFileMacosPlatform] that uses method channels.
class MethodChannelOpenFileMacos extends OpenFileMacosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_file_macos');

  @override
  Future<void> open(String file, {bool? viewInFinder, bool? isFileURL}) async {
    await methodChannel.invokeMethod<void>('open', <String, dynamic>{
      'file': file,
      'viewInFinder': viewInFinder,
      'isFileURL': isFileURL,
    });
  }
}

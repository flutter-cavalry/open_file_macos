import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_file_macos_method_channel.dart';

abstract class OpenFileMacosPlatform extends PlatformInterface {
  /// Constructs a OpenFileMacosPlatform.
  OpenFileMacosPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenFileMacosPlatform _instance = MethodChannelOpenFileMacos();

  /// The default instance of [OpenFileMacosPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenFileMacos].
  static OpenFileMacosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenFileMacosPlatform] when
  /// they register themselves.
  static set instance(OpenFileMacosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> open(String file, {bool? viewInFinder, bool? isFileURL}) async {
    throw UnimplementedError('open() has not been implemented.');
  }
}

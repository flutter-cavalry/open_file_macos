import 'open_file_macos_platform_interface.dart';

class OpenFileMacos {
  Future<void> open(String file, {bool? viewInFinder}) async {
    return OpenFileMacosPlatform.instance
        .open(file, viewInFinder: viewInFinder);
  }
}

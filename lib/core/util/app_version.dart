import 'package:package_info_plus/package_info_plus.dart';

class AppVersion {
  static PackageInfo? _packageInfo;
  static get packageInfo => _packageInfo;

  static String? _versionNumber;
  static String? get versionNumber => _versionNumber;

  static String? _buildNumber;
  static String? get buildNumber => _buildNumber;

  static String? get fullVersion => '$_versionNumber ($_buildNumber)';

  static Future<void> loadAppVersion() async {
    _packageInfo = await PackageInfo.fromPlatform();
    _versionNumber = packageInfo.version.split('-').first;
    _buildNumber = packageInfo.buildNumber;
  }
}

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/widgets.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;
  final FirebaseRemoteConfig _remoteConfig;
  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  String getString(String key) => _remoteConfig.getString(key);
  bool getBool(String key) => _remoteConfig.getBool(key);
  int getInt(String key) => _remoteConfig.getInt(key);
  double getDouble(String key) => _remoteConfig.getDouble(key);
  String get welcomeMessage =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.welcomeMessage);

  Future<void> _setConfigSettings() async =>
      _remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 5)));

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(const {
        FirebaseRemoteConfigKeys.welcomeMessage:
            'Hey there, this message is coming form local defaults'
      });

  Future<void> fetchAndActivated() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      debugPrint('The config  has been  updated');
    } else {
      debugPrint('The config  is not updated');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivated();
  }
}

// final message = FirebaseRemoteConfigService()
//     .getString(FirebaseRemoteConfigKey.welcomeMessage);
final message = FirebaseRemoteConfigService().welcomeMessage;

class FirebaseRemoteConfigKeys {
  static const String welcomeMessage = 'welcome_message';
}

import 'package:shared_preferences/shared_preferences.dart';

class PersistenceManager implements SettingsStorage, UserStorage, AppStorage {
  SharedPreferences _prefs;

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  String get accessToken {
    return _prefs.getString(_ACCESS_TOKEN) ?? UserStorage.defaultAccessToken;
  }

  @override
  void setAccessToken(String token) async {
    await _prefs.setString(_ACCESS_TOKEN, token);
  }

  static const _ACCESS_TOKEN = 'ACCESS_TOKEN';

  @override
  // TODO: implement langauge
  Language get langauge => throw UnimplementedError();

  @override
  void setLanguage(Language language) {
    // TODO: implement setLanguage
  }
}

abstract class UserStorage {
  static const String defaultAccessToken = null;
  String get accessToken;
  void setAccessToken(String token);
}

abstract class AppStorage {}

abstract class SettingsStorage {
  static const defaultLanguage = Language.UNSPECIFIED;
  Language get langauge;
  void setLanguage(Language language);
}

enum Language {
  ARABIC,
  ENGLISH,
  UNSPECIFIED,
}

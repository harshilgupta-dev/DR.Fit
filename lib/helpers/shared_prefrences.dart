import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  //same with Double String ,List ,bool
  //setter methods

  void setStringInPrefrences(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, value).then((check) => print(check));
  }

  void setIntInPrefrences(String key, int value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt(key, value).then((check) => print(check));
  }

  //Getter Methods

  Future<int> getIntInPrefrences(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int value = _prefs.getInt(key).toString() != 'null'
        ? int.parse(_prefs.getInt(key).toString())
        : 0;
    // print(value);
    return value;
  }

  Future<String?> getStringPrefrences(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString(key);
    return value;
  }
}

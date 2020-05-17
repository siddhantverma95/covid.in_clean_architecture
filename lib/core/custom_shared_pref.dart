import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class CustomSharedPreferences{
  String getString({@required String key});
  Future<bool> storeString({@required String key, @required String value});
}
class CustomSharedPreferencesImpl implements CustomSharedPreferences{
  final SharedPreferences sharedPreferences;

  CustomSharedPreferencesImpl(this.sharedPreferences): assert(sharedPreferences!=null);

  @override
  String getString({String key}) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> storeString({String key, String value}) {
    return sharedPreferences.setString(key, value);
  }


  
}
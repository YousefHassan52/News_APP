import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences shared;
  static  init()async{
    shared= await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolData(String key,bool value)async{
    return await shared.setBool(key, value);

  }
  static dynamic getBoolData(String key){

    return shared.getBool(key);
  }
}
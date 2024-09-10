
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCashHelper {
  Future<void>cashLanguageCode (String languageCode)async{
     final SharedPreferences sharedPrefix = await SharedPreferences.getInstance();
     sharedPrefix.setString("LOCALE", languageCode);
  }

  Future<String>getCashedLanguageCode ()async{
    final SharedPreferences shared =await SharedPreferences.getInstance();
    final cashedLanguageCode =shared.getString('LOCALE');
    if(cashedLanguageCode!=null){
      return cashedLanguageCode ;
    }else{
      return 'en' ;
    }
  }
}
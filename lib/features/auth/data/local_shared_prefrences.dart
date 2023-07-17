import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';

saveDataIsLogin(bool set)async{


  SharedPreferences preferences = await SharedPreferences.getInstance() ;
  preferences.setBool(isLogin, set)  ;
}

import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';

Future<void> setValue(bool value)async{

  SharedPreferences preferences = await SharedPreferences.getInstance() ;

  preferences.setBool(isLogin, value) ;

}

Future<bool> getValue()async{

  SharedPreferences preferences = await SharedPreferences.getInstance() ;

  return preferences.getBool(isLogin)??false ;

}

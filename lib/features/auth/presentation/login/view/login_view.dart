

import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: mainColor,
      body: LoginViewBody(),
    );
  }
}


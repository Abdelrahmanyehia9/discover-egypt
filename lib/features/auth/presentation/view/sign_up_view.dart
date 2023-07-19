import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';

import '../widgets/sign_up_view_body.dart';

class SignUPView extends StatelessWidget {
  const SignUPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SignUpViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myegypt/constant.dart';

import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/presentation/view/home_view.dart';
import '../manger/Auth_view_model.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/sign_up_view_body.dart';
import '../widgets/toggle_auth_button.dart';
import 'coplete_info_view.dart';
import 'login_view.dart';

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


class SignUpViewBody extends StatefulWidget {
  SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              SizedBox(
                height: dimHeight(context) * 0.05,
              ), // image
              SizedBox(
                width: double.infinity,
                height: dimHeight(context) * 0.28,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                hint: "Username",
                iconData: Icons.person,
                controller: _usernameController,
              ),

              CustomTextField(
                hint: "email",
                iconData: Icons.email,
                controller: _emailController,
              ),
              CustomTextField(
                  hint: "Password",
                  iconData: Icons.lock,
                  controller: _passwordController),
              CustomTextField(
                hint: " Confirm Password",
                controller: _cPasswordController,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                text: "Sign up",
                onTap: () {
                  if (_globalKey.currentState!.validate()) {
                    if ( _passwordController.text == _cPasswordController.text) {
                      controller.signUpUsingEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                          username: _usernameController.text.trim());
                      SignUpUserInfo.username = _usernameController.text.trim();

                    } else {
                      Get.snackbar("password doesn't Match",
                          "Password Doesn't Match Please ensure that you write  same password");
                    }
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ToggleAuthButton(
                text1: "Have Account already ! ",
                text2: "Login ",
                onPress: () {
                  Get.to(() => const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _cPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

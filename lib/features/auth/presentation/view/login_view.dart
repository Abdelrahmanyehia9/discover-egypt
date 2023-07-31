import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/auth/presentation/view/sign_up_view.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../manger/Auth_view_model.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/toggle_auth_button.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: GetBuilder<AuthViewModel>(
        init: AuthViewModel() ,
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                SizedBox(
                  height: dimHeight(context) * 0.1,
                ),
                SizedBox(
                  height: dimHeight(context) * .32,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                /// enter email
                CustomTextField(
                  hint: "email",
                  iconData: Icons.email,
                  controller: _emailController,
                ),

                ///enter password
                CustomTextField(
                    hint: "Password",
                    iconData: Icons.lock,
                    controller: _passwordController),
                const SizedBox(
                  height: 18,
                ),

                /// login button
                CustomButton(
                  text: "Log in",
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      controller.loginUsingEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ToggleAuthButton(
                    text1: "Don't Have an Account ? ",
                    text2: "Sign up  ",
                    onPress: () {
                      Get.to(() => const SignUPView());
                    }),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}



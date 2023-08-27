import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/auth/presentation/manger/Auth_view_model.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool secure = false;

  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _oldpass = TextEditingController();

  TextEditingController _newPass = TextEditingController();

  TextEditingController _newConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Form(
            key: globalKey,
            child: GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: dimHeight(context) * .05,
                  ),
                  TextFormField(
                    validator: (data) {
                      if (controller.oldPass != _oldpass.text) {
                        return "you have entered wrong pass";
                      } else {
                        return null;
                      }
                    },
                    controller: _oldpass,
                    obscureText: secure,
                    decoration: InputDecoration(
                        hintText: "current Password",
                        border: const OutlineInputBorder(),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                secure = !secure;
                              });
                            },
                            child: Icon(secure == false
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      controller: _newPass,
                      decoration: const InputDecoration(
                          hintText: "New Password",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  TextFormField(
                    controller: _newConfirmPass,
                    validator: (data) {
                      if (_newConfirmPass.text != _newPass.text) {
                        return "password doesn't match";
                      } else {
                        if (_newConfirmPass.text.length < 6){
                          return "please enter valid password" ;
                        }

                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder()),
                  ),
                  const Spacer(),
                  CustomButton(
                      text: "confirm",
                      color: mainColor,
                      onTap: () {
                        if (globalKey.currentState!.validate()) {
                          controller.updatePassword(
                              newPassword: _newConfirmPass.text);
                        }
                      }),
                  SizedBox(
                    height: dimHeight(context) * 0.04,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

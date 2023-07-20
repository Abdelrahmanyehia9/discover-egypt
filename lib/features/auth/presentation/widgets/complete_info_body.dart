import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/tourists_view_model.dart';
import 'package:myegypt/features/auth/presentation/manger/Auth_view_model.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'birthday_picker.dart';
import 'country_picker.dart';
import 'drop_down.dart';

class CompleteInfoBody extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();

  CompleteInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: dimHeight(context) * 0.1,
            ),
            const CustomText(
              text: "Fill Your Bio To Get Stated",
              size: 36,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 15,
            ),
            const MyTextField(hint: 'First Name'),
            const MyTextField(hint: 'Last Name'),
            MyTextField(hint: 'Phone Number', controller: _mobileController),
            const SizedBox(
              height: 4,
            ),
            const CountryPicker(),
            const SizedBox(
              height: 8,
            ),
            const BirthDayPicker(),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomText(
                  text: "i am",
                  fontWeight: FontWeight.w900,
                  size: 24,
                ),
                SizedBox(
                    width: dimWidth(context) * .7, child: const DropDownMenu()),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'Next',
              color: mainColor,
              onTap: () {
                AuthViewModel().updateInfoSignUp(
                    country: SignUpUserInfo.country ?? 'Egypt',
                    date: SignUpUserInfo.birthDate ?? '00/00/0000',
                    isMale: SignUpUserInfo.isMale ?? true);
                if (SignUpUserInfo.country != 'Egypt') {
                  TouristsViewModel().addTourists(
                    userName: SignUpUserInfo.username ?? 'Pharaoh',
                    email: FirebaseAuth.instance.currentUser!.email!,
                    passWord: 'NotFound',
                    country: SignUpUserInfo.country!,
                    birthDate: SignUpUserInfo.birthDate ?? 'null',
                    isMale: SignUpUserInfo.isMale ?? true,
                  );
                }
              },
            ),
            SizedBox(
              height: dimHeight(context) * .02,
            )
          ],
        ),
      ),
    );
  }
}

class SignUpUserInfo {
  static String? username;

  static String? country;

  static String? birthDate;

  static bool? isMale;
}

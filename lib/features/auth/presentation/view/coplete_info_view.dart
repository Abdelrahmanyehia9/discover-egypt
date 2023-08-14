import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/helper/validate.dart';
import 'package:myegypt/features/auth/presentation/view/chose_profile_image.dart';
import '../../../../constant.dart';
import '../../../../core/helper/sign_up_data.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../Egypt/presentation/viewmodel/tourists_view_model.dart';
import '../manger/Auth_view_model.dart';
import '../../../../core/utils/date_picker.dart';
import '../../../../core/utils/country_picker.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/drop_down.dart';

class CompleteInfo extends StatelessWidget {
  const CompleteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteInfoBody(),
    );
  }
}

class CompleteInfoBody extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  GlobalKey<FormState> global = GlobalKey<FormState>() ;
  CompleteInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Form(
          key : global ,
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
              const MyTextField(hint: 'First Name'  , ),
              const MyTextField(hint: 'Last Name' ),
              MyTextField(hint: 'Phone Number',type: TextInputType.phone, controller: _mobileController, validNotNull: true
              ,),
              const SizedBox(
                height: 4,
              ),
               const CountryPicker(),
              const SizedBox(
                height: 8,
              ),
               const DatePicker(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   CustomText(
                    text: "i am",
                    fontWeight: FontWeight.w900,
                    size: 24,color: mainColor,
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
                  if(global.currentState!.validate()){
                    AppInfoHelper.instance.mobile =_mobileController.text.trim() ;
                    Get.to(()=> const ChoseProfilePic()) ;
                  }
                  //
                  // }


                },
              ),
              SizedBox(
                height: dimHeight(context) * .02,
              )
            ],
          ),
        ),
      ),
    );
  }
}


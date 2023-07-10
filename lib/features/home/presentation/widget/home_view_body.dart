import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'my_tab_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children:  const [
          SizedBox(
            height: 16,
          ),
          CustomAppBar(),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: MyButtonTabBar()),
        ],
      ),
    );
  }
}






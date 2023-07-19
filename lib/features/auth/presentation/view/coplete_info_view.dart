import 'package:flutter/material.dart';

import '../widgets/complete_info_body.dart';

class CompleteInfo extends StatelessWidget {
  const CompleteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CompleteInfoBody(
      ) ,
    );
  }
}

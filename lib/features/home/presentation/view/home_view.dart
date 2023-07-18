import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/home/presentation/widget/home_view_body.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  const
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: HomeViewBody(),
    );
  }
}

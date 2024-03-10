import 'package:flutter/material.dart';
import 'package:libo/features/home/presentaion/widgets/home_body_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewBody()), );
  }
}
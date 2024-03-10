import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:libo/core/utils/assets_manager.dart';
import 'package:libo/core/utils/routing.dart';
import 'package:libo/features/splash/presentation/widgets/text_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          Assets.logo,
          width: 200.0,
        ),
        TextAnimation(animation: animation),
      ],
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    navegateTo();
  }

  void navegateTo() {
    Future.delayed(const Duration(seconds: 1), () {
      GoRouter.of(context).push(AppRouter.lHome);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

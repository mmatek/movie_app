import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../route/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => context.replaceNamed(RouteNames.home),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.secondaryDarkBlue,
        body: Center(
          child: Hero(
            tag: 'film-logo',
            child: SvgPicture.asset(
              AppAssets.kFLogo,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcOut),
            ),
          ),
        ),
      );
}

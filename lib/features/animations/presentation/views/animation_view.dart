import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/features/animations/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScalableSquare(),
              RotatingSquare(),
              SwitchingSquare(),
              AnimatedPosSquare(),
              SnakeSquare(),
              HeroSquare(),
            ],
          ),
        ),
      ),
    );
  }
}

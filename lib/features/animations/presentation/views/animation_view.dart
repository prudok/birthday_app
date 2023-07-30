import 'package:birthday_app/features/animations/presentation/widgets/animated_positioned_square.dart';
import 'package:birthday_app/features/animations/presentation/widgets/hero_square.dart';
import 'package:birthday_app/features/animations/presentation/widgets/rotating_square.dart';
import 'package:birthday_app/features/animations/presentation/widgets/scalable_square.dart';
import 'package:birthday_app/features/animations/presentation/widgets/snake_square.dart';
import 'package:birthday_app/features/animations/presentation/widgets/switching_square.dart';
import 'package:flutter/material.dart';

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

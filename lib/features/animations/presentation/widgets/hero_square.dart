import 'package:flutter/material.dart';

class HeroSquare extends StatelessWidget {
  const HeroSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'square',
      child: ColoredBox(
        color: Colors.purple,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => Scaffold(
                  floatingActionButton: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  body: const Hero(
                    tag: 'square',
                    child: Center(
                      child: ColoredBox(
                        color: Colors.purpleAccent,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          child: const SizedBox(
            height: 100,
            width: 100,
            child: Material(
              color: Colors.transparent,
              child: Center(child: Text('Click me!')),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wishlist View'),
      ),
    );
  }
}

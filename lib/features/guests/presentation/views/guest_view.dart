import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GuestView extends StatelessWidget {
  const GuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest View'),
      ),
      body: const Center(
        child: Text('Guest View'),
      ),
    );
  }
}

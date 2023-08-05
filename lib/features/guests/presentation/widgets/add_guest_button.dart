import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/guests/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddGuestButton extends StatelessWidget {
  const AddGuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          builder: (_) {
            return const GuestForm();
          },
        );
      },
      child: Image.asset(AssetPath.addButton),
    );
  }
}

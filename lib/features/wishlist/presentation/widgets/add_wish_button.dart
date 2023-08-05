import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/wishlist/presentation/widgets/wish_form.dart';
import 'package:flutter/material.dart';

class AddWishButton extends StatelessWidget {
  const AddWishButton({super.key});

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
            return const WishForm();
          },
        );
      },
      child: Image.asset(AssetPath.addButton),
    );
  }
}

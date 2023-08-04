import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthdayInputField extends StatelessWidget {
  BirthdayInputField({
    required TextEditingController controller,
    super.key,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.validator,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final String? Function(String?)? validator;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: validator,
      style: const TextStyle(height: 1),
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        filled: true,
        fillColor: kLightGreenColor,
        prefixIcon: leading,
        suffixIcon: trailing != null
            ? GestureDetector(
                onTap: trailingTapped,
                child: trailing,
              )
            : null,
        border: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorBorder: circularBorder.copyWith(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

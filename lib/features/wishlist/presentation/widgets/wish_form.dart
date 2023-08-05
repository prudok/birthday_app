import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/presentation/bloc/wish_bloc.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishForm extends StatefulWidget {
  const WishForm({super.key});

  @override
  State<WishForm> createState() => _WishFormState();
}

class _WishFormState extends State<WishForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wishBloc = BlocProvider.of<WishBloc>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPaddingSmall),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kGreyColor,
                ),
                height: 5,
                width: 30,
              ),
              verticalSpaceMedium,
              BirthdayInputField(
                controller: _nameController,
                placeholder: S.of(context).naming,
                validator: Validator.name,
              ),
              verticalSpaceSmall,
              BirthdayInputField(
                controller: _linkController,
                placeholder: S.of(context).link,
                validator: Validator.surname,
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50.h,
                width: 155.w,
                child: BirthdayButton(
                  title: S.of(context).addGift,
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      wishBloc.add(
                        AddWishEvent(
                          wishItem: WishItem(
                            name: _nameController.text,
                            link: _linkController.text,
                          ),
                        ),
                      );
                      if (context.router.canPop()) {
                        context.router.pop();
                      }
                    }
                  },
                ),
              ),
              verticalSpaceHigh,
              verticalSpaceHigh,
              verticalSpaceHigh,
            ],
          ),
        ),
      ),
    );
  }
}

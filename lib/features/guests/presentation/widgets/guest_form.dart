import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GuestForm extends StatefulWidget {
  const GuestForm({super.key});

  @override
  State<GuestForm> createState() => _GuestFormState();
}

class _GuestFormState extends State<GuestForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  late final GlobalKey<FormState> _globalKey;

  @override
  void initState() {
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthdayController.dispose();
    _phoneController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );
    if (date != null) {
      _birthdayController.text = DateFormat('dd-MM-yyyy').format(
        date,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final guestBloc = BlocProvider.of<GuestBloc>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPaddingSmall,
        ),
        child: Form(
          key: _globalKey,
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
                placeholder: S.of(context).name,
                validator: Validator.name,
              ),
              verticalSpaceSmall,
              BirthdayInputField(
                controller: _surnameController,
                placeholder: S.of(context).surname,
                validator: Validator.surname,
              ),
              verticalSpaceSmall,
              BirthdayInputField(
                controller: _birthdayController,
                placeholder: S.of(context).birthday,
                validator: Validator.birthday,
                trailing: IconButton(
                  icon: Image.asset(AssetPath.date),
                  onPressed: _showDatePicker,
                ),
              ),
              verticalSpaceSmall,
              BirthdayInputField(
                controller: _phoneController,
                placeholder: S.of(context).phone,
                validator: Validator.phone,
              ),
              verticalSpaceSmall,
              BirthdayInputField(
                controller: _professionController,
                placeholder: S.of(context).profession,
                validator: Validator.profession,
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50.h,
                width: 156.w,
                child: BirthdayButton(
                  title: S.of(context).enroll,
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      guestBloc.add(
                        AddGuestEvent(
                          guest: Guest(
                            birthday: _birthdayController.text,
                            name: _nameController.text,
                            phoneNumber: _phoneController.text,
                            profession: _professionController.text,
                            surname: _surnameController.text,
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
            ],
          ),
        ),
      ),
    );
  }
}

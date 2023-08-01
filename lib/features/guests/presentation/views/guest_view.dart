import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class GuestView extends StatefulWidget {
  const GuestView({super.key});

  @override
  State<GuestView> createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  void _clearAll() {
    _nameController.text = '';
    _surnameController.text = '';
    _birthdayController.text = '';
    _phoneController.text = '';
    _professionController.text = '';
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

  @override
  Widget build(BuildContext context) {
    // final guestBloc = BlocProvider.of<GuestBloc>(context);
    return Scaffold(
      appBar: BirthdayAppBar(
        title: BirthdayText.headingOne('Список гостей'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(AssetPath.leftArrow),
          onPressed: () {
            if (context.router.canPop()) {
              context.popRoute();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPaddingSmall,
                  ),
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
                      ),
                      verticalSpaceSmall,
                      BirthdayInputField(
                        controller: _surnameController,
                        placeholder: S.of(context).surname,
                      ),
                      verticalSpaceSmall,
                      BirthdayInputField(
                        controller: _birthdayController,
                        placeholder: S.of(context).birthday,
                      ),
                      verticalSpaceSmall,
                      BirthdayInputField(
                        controller: _phoneController,
                        placeholder: S.of(context).phone,
                      ),
                      verticalSpaceSmall,
                      BirthdayInputField(
                        controller: _professionController,
                        placeholder: S.of(context).profession,
                      ),
                      verticalSpaceMedium,
                      SizedBox(
                        height: 50.h,
                        width: 156.w,
                        child: BirthdayButton(
                          title: 'Записаться',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      verticalSpaceHigh,
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: kBlackColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPaddingSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BirthdayText.body('2 гостя'),
                  BirthdayText.custom(
                    'По имени ▼',
                    bodyStyle.copyWith(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            BlocBuilder<GuestBloc, GuestState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox(
                    child: BirthdayText.headingOne('Initial'),
                  ),
                  processing: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  successfull: (guestList) => ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: BirthdayText.body(guestList.guests[index].name),
                      );
                    },
                  ),
                  error: (Exception error) => Center(
                    child: BirthdayText.headingTwo('Something went wrong.'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/features/guests/presentation/widgets/widgets.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GuestView extends StatefulWidget {
  const GuestView({super.key});

  @override
  State<GuestView> createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  late final GuestBloc guestBloc;

  @override
  void initState() {
    guestBloc = BlocProvider.of<GuestBloc>(context);
    guestBloc.add(const GuestEvent.reload());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BirthdayAppBar(
        title: BirthdayText.headingOne(S.of(context).guestList),
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
      floatingActionButton: const AddGuestButton(),
      body: BlocBuilder<GuestBloc, GuestState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(
              child: BirthdayText.headingOne(S.of(context).addNewGuest),
            ),
            processing: () => const Center(
              child: CircularProgressIndicator(),
            ),
            successful: (guestList) => SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPaddingSmall,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BirthdayText.body('${guestList.guests.length} гостя'),
                        BirthdayText.custom(
                          'По имени ▼',
                          body1Style.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: guestList.guests.length,
                      itemBuilder: (_, ind) {
                        return _GuestTile(
                          name: guestList.guests[ind].name,
                          age: guestList.guests[ind].age,
                          profession: guestList.guests[ind].profession,
                          onTrailingTap: () => guestBloc.add(
                            GuestEvent.remove(
                              phoneNumber: guestList.guests[ind].phoneNumber,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            error: (Object error) => Center(
              child: BirthdayText.headingTwo(S.of(context).somethingWentWrong),
            ),
          );
        },
      ),
    );
  }
}

class _GuestTile extends StatelessWidget {
  const _GuestTile({
    required this.name,
    required this.age,
    required this.profession,
    this.onTrailingTap,
  });

  final String name;
  final String age;
  final String profession;
  final void Function()? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AssetPath.userPlaceholder),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onTrailingTap,
      ),
      isThreeLine: true,
      title: BirthdayText.custom(
        name,
        body1Style.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BirthdayText.custom(
            age,
            body2Style,
          ),
          BirthdayText.body(
            profession,
          ),
        ],
      ),
    );
  }
}

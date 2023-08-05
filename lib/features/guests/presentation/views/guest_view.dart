import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/features/guests/presentation/bloc/sorting_bloc.dart';
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
    super.initState();
    guestBloc = BlocProvider.of<GuestBloc>(context);
    guestBloc.add(const GuestEvent.reload());
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
            initial: () => const SizedBox(),
            processing: () => const Center(
              child: CircularProgressIndicator(),
            ),
            successful: (guestList) {
              BlocProvider.of<SortingBloc>(context).add(
                SortingEvent.sortByName(guests: guestList),
              );
              return BlocBuilder<SortingBloc, SortingState>(
                builder: (_, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    sorting: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    sortedByName: (GuestList guests) => GuestSortedList(
                      guestList: guests,
                    ),
                    sortedByAge: (GuestList guests) => GuestSortedList(
                      guestList: guests,
                    ),
                  );
                },
              );
            },
            error: (Object error) => Center(
              child: BirthdayText.headingTwo(S.of(context).somethingWentWrong),
            ),
          );
        },
      ),
    );
  }
}

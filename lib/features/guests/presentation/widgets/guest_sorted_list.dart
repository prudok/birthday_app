import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/features/guests/presentation/bloc/sorting_bloc.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestSortedList extends StatefulWidget {
  const GuestSortedList({required this.guestList, super.key});

  final GuestList guestList;

  @override
  State<GuestSortedList> createState() => _GuestSortedListState();
}

class _GuestSortedListState extends State<GuestSortedList> {
  String _selectedValue = 'По имени';

  void _dropdownCallback(String? value) {
    if (value != null) {
      setState(() {
        _selectedValue = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final guestBloc = BlocProvider.of<GuestBloc>(context);
    final sortingBloc = BlocProvider.of<SortingBloc>(context);
    return SingleChildScrollView(
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
                BirthdayText.body('${widget.guestList.guests.length} гостя'),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      value: S.of(context).byAge,
                      child: BirthdayText.body(S.of(context).byAge),
                      onTap: () => sortingBloc.add(
                        SortingEvent.sortByAge(guests: widget.guestList),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: S.of(context).byName,
                      child: BirthdayText.body(S.of(context).byName),
                      onTap: () => sortingBloc.add(
                        SortingEvent.sortByName(guests: widget.guestList),
                      ),
                    ),
                  ],
                  value: _selectedValue,
                  onChanged: _dropdownCallback,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: widget.guestList.guests.length,
              itemBuilder: (_, ind) {
                return _GuestTile(
                  name: widget.guestList.guests[ind].name,
                  age: widget.guestList.guests[ind].age,
                  profession: widget.guestList.guests[ind].profession,
                  avatarLink: widget.guestList.guests[ind].avatarLink,
                  onTrailingTap: () => guestBloc.add(
                    GuestEvent.remove(
                      phoneNumber: widget.guestList.guests[ind].phoneNumber,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
    this.avatarLink,
  });

  final String name;
  final String age;
  final String profession;
  final String? avatarLink;
  final void Function()? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatarLink == null
          ? Image.asset(AssetPath.userPlaceholder)
          : CircleAvatar(
              backgroundImage: NetworkImage(avatarLink!),
              radius: 28.r,
            ),
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

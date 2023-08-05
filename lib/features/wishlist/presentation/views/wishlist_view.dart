import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';
import 'package:birthday_app/features/wishlist/presentation/bloc/wish_bloc.dart';
import 'package:birthday_app/features/wishlist/presentation/widgets/widgets.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  late final WishBloc wishBloc;

  @override
  void initState() {
    super.initState();
    wishBloc = BlocProvider.of<WishBloc>(context);
    wishBloc.add(const WishEvent.reload());
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
      floatingActionButton: const AddWishButton(),
      body: BlocBuilder<WishBloc, WishState>(
        builder: (_, state) {
          return state.when(
            initial: () => Center(child: Text(S.of(context).addNewWish)),
            processing: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (Object error) => Center(
              child: Text(S.of(context).somethingWentWrong),
            ),
            successful: (WishList wishList) => SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: wishList.items.length,
                      itemBuilder: (_, ind) {
                        return _WishTile(
                          name: wishList.items[ind].name,
                          link: wishList.items[ind].link,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WishTile extends StatefulWidget {
  const _WishTile({
    required this.name,
    required this.link,
  });

  final String name;
  final String link;

  @override
  State<_WishTile> createState() => _WishTileState();
}

class _WishTileState extends State<_WishTile> {
  bool _isUnique = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: BirthdayText.custom(
        widget.name,
        body1Style.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: GestureDetector(
        onTap: () async {
          try {
            final url = Uri.parse(widget.link);
            await launchUrl(url);
          } catch (error, stackTrace) {
            Error.throwWithStackTrace(error, stackTrace);
          }
        },
        child: BirthdayText.custom(
          widget.link,
          body1Style.copyWith(decoration: TextDecoration.underline),
        ),
      ),
      trailing: GestureDetector(
        onTap: () => setState(() {
          _isUnique = !_isUnique;
        }),
        child: CircleAvatar(
          radius: 10.w,
          backgroundColor: _isUnique ? kBlackColor : kGreyColor,
        ),
      ),
    );
  }
}

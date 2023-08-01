import 'package:birthday_app/config/injection.dart';
import 'package:birthday_app/config/router.dart';
import 'package:birthday_app/core/themes.dart';
import 'package:birthday_app/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<GuestBloc>(),
            ),
          ],
          child: MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            routerConfig: getIt.get<AppRouter>().config(),
          ),
        );
      },
    );
  }
}

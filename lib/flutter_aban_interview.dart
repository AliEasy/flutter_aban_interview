import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/core/theme/management/theme_management_cubit.dart';
import 'package:flutter_aban_interview/features/login/presentation/page/login_page.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterAbanInterview extends StatelessWidget {
  const FlutterAbanInterview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeManagementCubit>(),
      child: BlocBuilder<ThemeManagementCubit, ThemeMode>(
        builder: (context, state) {
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Aban Interview',
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en')],
                debugShowCheckedModeBanner: false,
                themeMode: state,
                theme: ThemeData(
                  brightness: Brightness.light,
                  useMaterial3: true,
                  colorSchemeSeed: const Color(0xFF4C6FFF),
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                  ),
                  dialogTheme: const DialogTheme(
                    titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  useMaterial3: true,
                  colorSchemeSeed: const Color(0xFFFF7847),
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                  ),
                  dialogTheme: const DialogTheme(
                    titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                home: const LoginPage(),
              );
            }
          );
        },
      ),
    );
  }
}

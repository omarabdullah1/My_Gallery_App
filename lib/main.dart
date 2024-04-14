import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:my_gallery_app/presentation/router/app_router.dart';
import 'package:my_gallery_app/presentation/styles/colors.dart';
import 'package:my_gallery_app/presentation/widget/toast.dart';

import 'business_logic/app_localization.dart';
import 'business_logic/bloc_observer.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'data/local/cache_helper.dart';
import 'data/remote/dio_helper.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  const locale ="en";
  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(const Locale(locale));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return LocalizedApp(
            delegate,
            LayoutBuilder(builder: (context, constraints) {
              return MaterialApp(
                // debugShowCheckedModeBanner: false,
                title: 'Flutter Gallery',
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  delegate,
                ],
                locale: delegate.currentLocale,

                supportedLocales: delegate.supportedLocales,
                onGenerateRoute: widget.appRouter.onGenerateRoute,
                theme: ThemeData(
                  fontFamily: 'cairo',
                  progressIndicatorTheme: const ProgressIndicatorThemeData(
                      color: AppColor.defaultColor),
                  primarySwatch: AppColor.defaultColor,
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: AppColor.defaultColor,
                    cursorColor: AppColor.defaultColor,
                    selectionColor: AppColor.defaultColor,
                  ),
                  radioTheme: RadioThemeData(
                    fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.defaultColor,
                    ),
                  ),
                  // splashColor: AppColor.indigoDye,
                  //scaffoldBackgroundColor: AppColors.white,
                  appBarTheme: const AppBarTheme(
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: AppColor.transparent,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

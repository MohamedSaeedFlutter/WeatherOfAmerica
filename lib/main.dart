
import 'package:american_weather/screens/cerruosol.dart';
import 'package:american_weather/api/fetch_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
      // EasyLocalization(
      //   supportedLocales: [Locale('en'), Locale('ar')],
      //   path: 'assets/languages', // <-- change the path of the translation files
      //   fallbackLocale: const Locale('en'),
      //   child:
        BlocProvider(create: (context) => FetchApi(),
          child:  MyApp(),
      //   ),
      )
  );
}

class MyApp extends StatefulWidget {

  // const MyApp({Key key}) : super(key: key);
  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Locale _locale;
  //
  // void setLocale(Locale value) {
  //   setState(() {
  //     _locale = value;
  //   });}
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
                data:  const MediaQueryData(),
                child: MaterialApp(
                  // localizationsDelegates: context.localizationDelegates,
                  // supportedLocales: context.supportedLocales,
                  // locale: context.locale,
                  // locale: _locale,
                  debugShowCheckedModeBanner: false,
                  title: 'Weather of America',
                  theme: ThemeData(
                      backgroundColor: Colors.purple,
                      primaryColor: Colors.purple,
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.purple)),
                  home: FullscreenSliderDemo(),
                )
);
    }// Otherwise, show something whilst waiting for initialization to complete
  }



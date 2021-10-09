
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
                  theme: ThemeData(backgroundColor: Colors.teal,
                    textTheme: const TextTheme(bodyText1:TextStyle(fontSize: 16,color: Colors.white,
                        fontWeight: FontWeight.w500,fontFamily: 'Montserrat' ),
                      bodyText2:TextStyle(fontSize: 12,color: Colors.white,
                          fontWeight: FontWeight.w400,fontFamily: 'Montserrat' ),
                      button: TextStyle(fontSize: 14,color: Colors.white,
                          fontWeight: FontWeight.w500,fontFamily: 'Montserrat' ),
                      headline1: TextStyle(fontSize: 26,color: Colors.amber,
                          fontWeight: FontWeight.w700,fontFamily: 'Montserrat' ),
                      headline2:TextStyle(fontSize: 22,color: Colors.amberAccent,
                          fontWeight: FontWeight.w600,fontFamily: 'Montserrat' ),
                    ),

                    colorScheme: const ColorScheme(
                      background: Colors.teal,
                      brightness:Brightness.light, onError: Colors.amberAccent,
                      onBackground: Colors.lightGreen, secondaryVariant: Colors.limeAccent,
                      primary: Colors.amberAccent,secondary: Colors.white, onSurface: Colors.teal,
                      surface: Colors.tealAccent, onPrimary: Colors.amber, error: Colors.redAccent,
                      primaryVariant:Colors.amber, onSecondary:Colors.cyan,),
                    iconTheme: const IconThemeData(color: Colors.amberAccent, opacity: 0.9,size: 24),


                    // appBarTheme: ,
                    // applyElevationOverlayColor: ,
                    // bannerTheme: ,
                    // bottomAppBarTheme: ,
                    // bottomNavigationBarTheme: ,
                    // bottomSheetTheme: ,
                    // buttonTheme: ,
                    // cardTheme: ,
                    // checkboxTheme: ,
                    // dialogBackgroundColor: ,
                    // dialogTheme: ,
                    // elevatedButtonTheme: ,
                    // scaffoldBackgroundColor: ,

                  ),
                  home: FullscreenSliderDemo(),
                )
);
    }// Otherwise, show something whilst waiting for initialization to complete
  }



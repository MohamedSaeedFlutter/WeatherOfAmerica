import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemData extends StatelessWidget {
  ThemData(ThemeData themeData);


  @override
  Widget build(BuildContext context) {
    return  ThemData(
      ThemeData(backgroundColor: Colors.teal,
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

        colorScheme: const ColorScheme(background: Colors.teal,
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
    );
  }
}

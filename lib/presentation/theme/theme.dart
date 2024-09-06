import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const defaultSpacer = SizedBox(height: defaultPadding);
const defaultSpacerSmall = SizedBox(height: defaultPadding / 2);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(width: defaultPadding / 2);

const sliverSpacer = SliverToBoxAdapter(
  child: defaultSpacer,
);

//const colours
const primaryColor = Color(0xFF023B69);
const primaryColorlight = Color(0xFF699DEE);
const acentColor = Color(0xFF026ABE);
const colorBlue = Color(0xFF699DEE);
const colorBluelite = Color(0xFF00BCD4);
const secondaryColor = Color(0xFFFF8C23);
const containerBg = Color(0xFFE9EEF5);
const whiteColor = Colors.white;
const blackColor = Color(0xFF061737);
const errorColor = Color(0xFFF02733);
const violetColor = Color(0xFFB38EFC);
const pinkColor = Color(0xFFFF8EB0);
const orangeColor = Color(0xFFFF8C23);
const successColor = Color(0xFF39A998);
const activeColor = Color(0xFF27C60D);
const activeColorlite = Color(0xFF4CAF50);
const successColorlight = Color(0xFFEBFFE8);
const brownColor = Color(0xFF92969D);
const amberColor = Color(0xFFFECD67);
const avatharBg = Color(0xFFD9D9D9);
const avatharOuterBg = Color(0xFFF5F5F5);
const defaultGradiant = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [Color(0xFF0067BA), Color(0xFF023B69)],
);
const defaultGradiantlight = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [Color(0xFFFFFFFF), Color(0xFFE9EEF5)],
);
const defaultGradiantActive = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [Color(0xFF39A998), Color(0xFF1BA691)],
);
const defaultGradiantInActive = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [errorColor, errorColor],
);
const gradiantColor1 =
    LinearGradient(colors: [Color(0xFFFF8EB0), Color(0xFFF96491)]);
const gradiantColor2 =
    LinearGradient(colors: [Color(0xFF699DEE), Color(0xFF739BFF)]);
const gradiantColor3 =
    LinearGradient(colors: [Color(0xFFFC3BB2), Color(0xFFF7906E)]);
const gradiantColor4 =
    LinearGradient(colors: [Color(0xFFF2994A), Color(0xFFF2C94C)]);
const gradiantColor5 =
    LinearGradient(colors: [Color(0xFFAF8EFC), Color(0xFF7E55DA)]);
const gradiantColor6 =
    LinearGradient(colors: [Color(0xFF39A998), Color(0xFF1BA691)]);
const gradiantColor7 =
    LinearGradient(colors: [Color(0xFFFB4BF0), Color(0xFF7268F8)]);
const greenGradiant =
    LinearGradient(colors: [Colors.greenAccent, Colors.lightGreen]);
    const errorGradiant =
    LinearGradient(colors: [errorColor, errorColor]);
    const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const defaultAnimationDuration = Duration(milliseconds: 500);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(1.1, 1.1),
    blurRadius: 5,
  ),
];

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    // systemNavigationBarColor: Colors.white,
    // systemNavigationBarDividerColor: Colors.grey,
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

// generateAnimatedRoute(RouteSettings settings) {
//   final routes = Routes.getRoutes(settings);
//   final WidgetBuilder builder = routes[settings.name]!;
//   return FadeScaleRouteBuilder(
//     builder: builder,
//   );
// }

class FadeScale extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    var curve = Curves.ease;
    var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }
}

ThemeData themeData(context) {
  return ThemeData.light().copyWith(
      unselectedWidgetColor: primaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        unselectedItemColor: blackColor,
        selectedLabelStyle: TextStyle(color: primaryColor),
      ),
      textTheme: GoogleFonts.robotoTextTheme(),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: blackColor,
        labelColor: whiteColor,
        indicator: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor))),
      chipTheme: Theme.of(context).chipTheme.copyWith(
          secondaryLabelStyle: const TextStyle(color: whiteColor),
          secondarySelectedColor: primaryColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: blackColor)))),
      appBarTheme: AppBarTheme(
          backgroundColor: containerBg,
          elevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          titleTextStyle: Theme.of(context).textTheme.headline6BoldBlack()),
      platform: TargetPlatform.iOS,
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultPadding * .3, vertical: defaultPadding * .3),
        elevation: defaultPadding * .5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
        shadowColor: Colors.black38,
      ),
      scaffoldBackgroundColor: containerBg,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: const BorderSide(color: primaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: const BorderSide(color: errorColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5)))));
}

extension ThemeExtension on TextTheme {
  TextStyle headline6BoldBlack() =>
      headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle headline6BoldPrimary() =>
      titleLarge!.copyWith(fontWeight: FontWeight.bold, color: primaryColor);
  TextStyle headline5BoldBlack() =>
      headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle bodyText1White() => bodyLarge!.copyWith(color: whiteColor);
  TextStyle bodySubtitle1White() => titleMedium!.copyWith(color: whiteColor);
}

ThemeData smallTab(BuildContext context) {
  return ThemeData(
      scaffoldBackgroundColor: containerBg,
      textTheme: GoogleFonts.robotoTextTheme(),
      appBarTheme: AppBarTheme(
          backgroundColor: containerBg,
          elevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          titleTextStyle: Theme.of(context).textTheme.headline6BoldBlack()),
      tabBarTheme: const TabBarTheme(
          labelColor: blackColor,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: secondaryColor,
                width: 2.0,
              ),
            ),
          )),
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultPadding * .3, vertical: defaultPadding * .3),
        elevation: defaultPadding * .5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
        shadowColor: Colors.black38,
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: const BorderSide(color: primaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: const BorderSide(color: errorColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2),
              borderSide: BorderSide(color: brownColor.withOpacity(.5)))));
}

import 'package:cooknotes/module1_screen/splash_screen.dart';
import 'package:cooknotes/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (context) => ValueNotifier(true),
      child: Consumer<ValueNotifier<bool>>(
          builder: (_, notifier, __) => MaterialApp(
                onGenerateRoute: createRoute,
                title: 'Cook Notes Demo',
                debugShowCheckedModeBanner: false,
                theme: notifier.value
                    ? ThemeData(primaryColor: Colors.white)
                    : ThemeData(
                        // primaryColor: Colors.black,
                        scaffoldBackgroundColor: Colors.black,
                        accentColor: Color(0xff00556A),
                        bottomNavigationBarTheme: BottomNavigationBarThemeData(
                            backgroundColor: Colors.black,
                            unselectedItemColor: Colors.white),
                        inputDecorationTheme: InputDecorationTheme(
                          fillColor: Colors.white,
                        ),
                        textTheme: TextTheme(
                            bodyText2: TextStyle(color: Colors.white)),
                        cardColor: Colors.grey,
                        dividerTheme: DividerThemeData(color: Colors.white),
                        appBarTheme: AppBarTheme(color: Colors.black)),
                home: SplashScreens(),
              ))));
}
/* void main() {
  runApp(MyApp());
} */

/* class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cook Notes Demo',
        //    onGenerateRoute: createRoute,
        debugShowCheckedModeBanner: false,
        //  home: HomeScreen(mockData[0], mockData));
        // home: ProfileScreen(mockData[1]));

        home: SplashScreens());
    //  home: UpdateRecipeScreen(mockData[1].recipe[1]));
    //  home: DisplayRecipeScreen(mockData[1].recipe[1]));
    //home: RecipeListScreen(mockData[1]));
    //home: DisplayArticleScreen(mockData[1].article[0]));
  }
} */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

void main() {
  runApp(SplashScreen());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notas',
      //--------------------- <THEAMING> -----------------------------------
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      //--------------------- </THEAMING> -----------------------------------
      //--------------------- <PAGINATION> -----------------------------------
      initialRoute: NotesHomepage.ROUTE_NAME,
      getPages: [
        GetPage(
          name: NotesHomepage.ROUTE_NAME,
          page: () => NotesHomepage(),
          transition: Transition.fadeIn,
        ),
      ],
      /*unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),*/
      //--------------------- </PAGINATION> -----------------------------------
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return MyApp();
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await NotesUIModule.init();
  }
}

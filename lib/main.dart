import 'dart:async';

import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_notes/maple_notes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      print("Error From INSIDE FRAME_WORK");
      print("----------------------");
      print("Error :  ${details.exception}");
      print("StackTrace :  ${details.stack}");
    };
    runApp(SplashScreen());
  }, (error, stackTrace) {
    print("Error FROM OUT_SIDE FRAMEWORK ");
    print("--------------------------------");
    print("Error :  $error");
    print("StackTrace :  $stackTrace");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          page: () => const NotesHomepage(),
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
          return const MyApp();
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await KeyValueCoreModule
        .init(); //cuando es este modulo solo hay que inicializarlo
    await NotesUIModule.init();
  }
}

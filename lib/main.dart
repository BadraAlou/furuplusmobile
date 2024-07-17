import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller_hive.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/screens/introduction_screen.dart';
import 'package:furuplus/screens/main_menu_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  Directory document = await getApplicationDocumentsDirectory();
  print('*** Hive Yo le doc path ${document.path}');
  Hive..init(document.path)
    ..registerAdapter(ReservationAdapter());

  await Hive.openBox("reservationBox");
  Get.put(ReservationHiveController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          //home: IntroScreen(),
          home: MainMenuPage(),
          // home: FirebaseAuth.instance.currentUser != null
          //     ? const MainMenuPage() : const LoginPage()
          // ,
          debugShowCheckedModeBanner: false,
        );

      },
      //child: const MyHomePage(title: 'Arctec Archi'),
      //child: const ExpansionPanelTest(),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/screens/main_menu_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'FURU +',
            body: 'MARIAGE PARFAIT',
            image: buildImage("assets/image1.jpg"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'FURU +',
            body: 'MARIAGE IDEAL',
            image: buildImage("assets/image2.jpg"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'FURU +',
            body: 'MARIAGE PARFAIT',
            image: buildImage("assets/image3.jpg"),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          if (kDebugMode) {
            print("Done clicked");
          }
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (builder) => MainMenuPage(),
            ),
                (route) => false,
          );
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: const Text("Passer", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.forward),
        done: const Text("Menu", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: getDotsDecorator(),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return Center(
      child: Image.asset(
        imagePath,
        width: 450.w,
        height: 300.h,
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}

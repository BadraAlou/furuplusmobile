import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/screens/decoration_screen.dart';
import 'package:furuplus/screens/info_screen.dart';
import 'package:furuplus/screens/pack_list.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/widgets/header_widget_new.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100.h, // Hauteur adaptative
            child: HeaderWidgetNew(
              height: 100.h,
              showIcon: false,
              icon: Icons.home,
              primaryColor: Colors.blue,
              secondaryColor: Colors.red,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200.w), // Bordure adaptative
              ),
            ),
            child: OrientationBuilder(
              builder: (context, orientation) {
                int crossAxisCount = orientation == Orientation.portrait ? 2 : 4;

                return GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 40.w, // Espacement adaptatif
                  mainAxisSpacing: 30.h, // Espacement adaptatif
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PackListScreen());
                      },
                      child: itemDashboard(
                        'Packs',
                        CupertinoIcons.gift,
                        Colors.deepOrange,
                        context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LocalReservationsScreen());
                      },
                      child: itemDashboard(
                        'Reservations',
                        CupertinoIcons.money_dollar,
                        Colors.green,
                        context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DecorationScreen());
                      },
                      child: itemDashboard(
                        'Decorations',
                        CupertinoIcons.table_fill,
                        Colors.purple,
                        context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => InfoScreen());
                      },
                      child: itemDashboard(
                        'Infos',
                        CupertinoIcons.info,
                        Colors.brown,
                        context,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20.h), // Espacement adaptatif
        ],
      ),
    );
  }

  Widget itemDashboard(
      String title,
      IconData iconData,
      Color background,
      BuildContext context,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w), // Bordure adaptative
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5.h),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white, size: 20.sp), // Taille d'icône adaptative
          ),
          SizedBox(height: 8.h), // Espacement adaptatif
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 14.sp, // Taille de texte adaptative
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

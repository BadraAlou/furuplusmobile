import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furuplus/screens/pack_list.dart';
import 'package:furuplus/screens/plus_page.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/widgets/header_widget_new.dart';
import 'package:get/get.dart';

class MainMenuPage2 extends StatefulWidget {
  const MainMenuPage2({Key? key}) : super(key: key);

  @override
  State<MainMenuPage2> createState() => _MainMenuPage2State();
}

class _MainMenuPage2State extends State<MainMenuPage2> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                child: HeaderWidgetNew(
                  height: 100,
                  showIcon: false,
                  icon: Icons.home,
                  primaryColor: Colors.blue,
                  secondaryColor: Colors.red,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isLandscape ? 3 : 2, // Adjust the cross axis count based on orientation
                  crossAxisSpacing: size.width * 0.05, // Dynamic spacing
                  mainAxisSpacing: size.height * 0.03, // Dynamic spacing
                  children: [
                    buildDashboardItem(
                      context: context,
                      title: 'Packs',
                      iconData: CupertinoIcons.gift,
                      backgroundColor: Colors.deepOrange,
                      onTap: () => Get.to(() => PackListScreen()),
                    ),
                    buildDashboardItem(
                      context: context,
                      title: 'Conseils',
                      iconData: CupertinoIcons.money_dollar,
                      backgroundColor: Colors.green,
                      onTap: () => Get.to(() => LocalReservationsScreen()),
                    ),
                    buildDashboardItem(
                      context: context,
                      title: 'Infos',
                      iconData: CupertinoIcons.money_dollar_circle,
                      backgroundColor: Colors.purple,
                      onTap: () {},
                    ),
                    buildDashboardItem(
                      context: context,
                      title: 'Plus',
                      iconData: CupertinoIcons.list_number,
                      backgroundColor: Colors.brown,
                      onTap: () => Get.to(PlusPage()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget buildDashboardItem({
    required BuildContext context,
    required String title,
    required IconData iconData,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.03), // Dynamic padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
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
              padding: EdgeInsets.all(size.width * 0.05), // Dynamic padding for icon container
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white, size: size.width * 0.1), // Dynamic icon size
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: size.width * 0.04), // Dynamic text size
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

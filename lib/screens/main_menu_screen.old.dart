import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furuplus/screens/pack_list.dart';
import 'package:furuplus/screens/pack_page.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/widgets/header_widget.dart';
import 'package:furuplus/widgets/header_widget_new.dart';
import 'package:get/get.dart';
//import 'package:ikadjatebeta/screens/ventes_screen.dart';

class MainMenuPageOld extends StatefulWidget {
  const MainMenuPageOld({Key? key}) : super(key: key);

  @override
  State<MainMenuPageOld> createState() => _MainMenuPageOldState();
}

class _MainMenuPageOldState extends State<MainMenuPageOld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Container(
          //   height: 200,
          //   child: HeaderWidget(200, true,
          //       Icons.login_rounded), //let's create a common header widget
          // ),
          Container(
            height: 100,
            child: HeaderWidgetNew(height: 100, showIcon: false, icon: Icons.home,
                primaryColor: Colors.blue, secondaryColor: Colors.red
            ), //let's create a common header widget
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor,
          //     borderRadius: const BorderRadius.only(
          //       bottomRight: Radius.circular(50),
          //     ),
          //   ),
          //   child: Column(
          //     children: [
          //       //const SizedBox(height: 50),
          //       ListTile(
          //         contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          //         title: Text('Bienvenu', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //             color: Colors.white
          //         )),
          //         subtitle: Text('Bonjour Mr', style: Theme.of(context).textTheme.titleMedium?.copyWith(
          //             color: Colors.white54
          //         )),
          //         trailing: const CircleAvatar(
          //           radius: 30,
          //          // backgroundImage: AssetImage('assets/images/user.JPG'),
          //           backgroundImage: AssetImage('assets/user.png'),
          //         ),
          //       ),
          //       const SizedBox(height: 30)
          //     ],
          //   ),
          // ),
          Container(
            //color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (builder) => const PacksPage(),
                      //   ),
                      // );
                      Get.to(() => PackListScreen());
                    },
                    child: itemDashboard('Packs', CupertinoIcons.gift, Colors.deepOrange),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => LocalReservationsScreen());
                    },
                    child : itemDashboard('Conseils', CupertinoIcons.money_dollar, Colors.green),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (builder) => DettesScreen(),
                      //   ),
                      // );
                    },
                    child: itemDashboard('Infos', CupertinoIcons.money_dollar_circle, Colors.purple),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (builder) => FacturesScreen(),
                      //   ),
                      // );
                    },
                    child: itemDashboard(
                        'Plus',
                        CupertinoIcons.list_number, Colors.brown),
                  ),





                  // itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                  // itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal),
                  // itemDashboard('About', CupertinoIcons.question_circle, Colors.blue),
                  // itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent),

                  // itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange),
                  // itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.green),
                  // itemDashboard('Audience', CupertinoIcons.person_2, Colors.purple),
                  // itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                  // itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                  // itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal),
                  // itemDashboard('About', CupertinoIcons.question_circle, Colors.blue),
                  // itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }


  itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5
          )
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium)
      ],
    ),
  );

}

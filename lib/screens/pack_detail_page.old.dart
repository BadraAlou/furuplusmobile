import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/forms/reservation_form.dart';
import 'package:furuplus/models/pack_model.dart';
import 'package:furuplus/screens/pack_list.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/utils/custom_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PackDetailPage extends StatefulWidget {
  const PackDetailPage({super.key, required this.pack});
  final Pack pack;

  @override
  State<PackDetailPage> createState() => _PackDetailPageState();
}

class _PackDetailPageState extends State<PackDetailPage> {
  final ReservationController reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.list),
        //     onPressed: () {
        //       Get.to(() => LocalReservationsScreen());
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.delete),
        //     onPressed: () {
        //       reservationController.clearLocalReservations();
        //       Get.snackbar('Succès', 'Réservations locales supprimées.');
        //     },
        //   ),
        // ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Obtenez les dimensions de l'écran
                  double screenHeight = constraints.maxHeight;
                  double screenWidth = constraints.maxWidth;

                  // Ajustez les tailles en fonction de l'orientation
                  bool isLandscape = orientation == Orientation.landscape;

                  double imageHeight = isLandscape ? screenHeight * 0.4 : screenHeight * 0.3;
                  double padding = screenWidth * 0.05;
                  double titleFontSize = isLandscape ? screenWidth * 0.04 : screenWidth * 0.05;
                  double subtitleFontSize = isLandscape ? screenWidth * 0.03 : screenWidth * 0.04;

                  return ListView(
                    padding: EdgeInsets.all(padding),
                    children: [
                      Image(
                        image: NetworkImage(widget.pack.image),
                        height: imageHeight,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: padding),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            '${widget.pack.name} (${widget.pack.price} fcfa)',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            widget.pack.description,
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              //fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: padding),
                      AdaptiveButton(
                        text: 'Réserver',
                        icon: Icons.check_circle_outline,
                        onPressed: () {
                          Get.to(() => ReservationFormScreen());
                        },
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> createReservation() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/reservations/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pack': '1',  // Assuming pack with id 1 exists
        'date': '2024-06-15',
        'first_name': 'John',
        'last_name': 'Doe',
        'phone_number': '+123456789',
        'wedding_date': '2024-12-15',
        'address': '123 Main St',
      }),
    );

    if (response.statusCode == 201) {
      print('Réservation créée avec succès');
    } else {
      print('Échec de la création de la réservation');
    }
  }
}

// main.dart

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/utils/custom_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ReservationController reservationController = Get.put(ReservationController());

  final TextEditingController packIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController weddingDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    packIdController.text = reservationController.selectedPack.value.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( // Ajouter SingleChildScrollView pour permettre le défilement si nécessaire
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: packIdController,
                  decoration: InputDecoration(labelText: 'Pack ID'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Pack ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, dateController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: weddingDateController,
                  decoration: InputDecoration(
                    labelText: 'Wedding Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, weddingDateController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the wedding date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (reservationController.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return AdaptiveButton(
                      text: 'Réserver',
                      icon: Icons.check_circle_outline,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Reservation reservation = Reservation(
                            //packId: int.parse(packIdController.text),
                              packId: reservationController.selectedPack.value.id,
                              date: dateController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phoneNumber: phoneNumberController.text,
                              weddingDate: weddingDateController.text,
                              address: addressController.text,
                              packName: reservationController.selectedPack.value.name
                          );

                          reservationController.submitReservation(reservation);
                          ReservationHiveModel reservationHiveModel = ReservationHiveModel(
                              packId: reservationController.selectedPack.value.id,
                              date: dateController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phoneNumber: phoneNumberController.text,
                              weddingDate: weddingDateController.text,
                              address: addressController.text,
                              packName: reservationController.selectedPack.value.name
                          );
                          reservationHiveModel.add();
                          //reservationController.saveReservationLocal(reservation);
                          Get.to(() => LocalReservationsScreen());
                        }
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );

                  }
                }),
                Obx(() {
                  if (reservationController.isSuccess.value) {
                    return Text('Reservation successful', style: TextStyle(color: Colors.green));
                  }
                  return Container();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
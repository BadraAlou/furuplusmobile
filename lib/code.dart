// main.dart

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    packIdController.text = reservationController.selectedPack.value.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: packIdController,
                decoration: InputDecoration(labelText: 'Pack ID'),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Pack ID';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date'),
                keyboardType: TextInputType.datetime,
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
                decoration: InputDecoration(labelText: 'Wedding Date'),
                keyboardType: TextInputType.datetime,
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
                  return ElevatedButton(
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
                        );

                        reservationController.submitReservation(reservation);
                      }
                    },
                    child: Text('Submit'),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:furuplus/screens/reservation_page.dart';
import 'package:furuplus/utils/custom_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  void dispose() {
    packIdController.dispose();
    dateController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    weddingDateController.dispose();
    addressController.dispose();
    //super.dispose();
  }

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
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    packIdController.text = reservationController.selectedPack.value.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation', style: TextStyle(fontSize: 20.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: packIdController,
                  decoration: InputDecoration(
                    labelText: 'Pack ID',
                    labelStyle: TextStyle(fontSize: 16.sp),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Pack ID';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(fontSize: 16.sp),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, size: 24.sp),
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
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(fontSize: 16.sp),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(fontSize: 16.sp),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(fontSize: 16.sp),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: weddingDateController,
                  decoration: InputDecoration(
                    labelText: 'Wedding Date',
                    labelStyle: TextStyle(fontSize: 16.sp),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, size: 24.sp),
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
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(fontSize: 16.sp),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 20.h),
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
                            packId: reservationController.selectedPack.value.id,
                            date: dateController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                            weddingDate: weddingDateController.text,
                            address: addressController.text,
                            packName: reservationController.selectedPack.value.name,
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
                            packName: reservationController.selectedPack.value.name,
                          );
                          reservationHiveModel.add();
                          Get.to(() => LocalReservationsScreen());
                        }
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );
                  }
                }),
                SizedBox(height: 10.h),
                Obx(() {
                  if (reservationController.isSuccess.value) {
                    return Text('Reservation successful', style: TextStyle(color: Colors.green, fontSize: 16.sp));
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

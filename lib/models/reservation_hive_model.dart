import 'package:furuplus/boxs/reservation_box.dart';
import 'package:furuplus/controllers/reservation_controller_hive.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'reservation_hive_model.g.dart'; // Génération du fichier de code Hive

@HiveType(typeId: 0) // Définition du typeId pour Hive
class ReservationHiveModel {
  @HiveField(0)
  late int packId;

  @HiveField(1)
  late String date;

  @HiveField(2)
  late String firstName;

  @HiveField(3)
  late String lastName;

  @HiveField(4)
  late String phoneNumber;

  @HiveField(5)
  late String weddingDate;

  @HiveField(6)
  late String address;

  @HiveField(7)
  late String? packName;

  ReservationHiveModel({
    required this.packId,
    required this.date,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.weddingDate,
    required this.address,
    this.packName,
  });

  factory ReservationHiveModel.fromJson(Map<String, dynamic> json) {
    return ReservationHiveModel(
      packId: json['pack'],
      date: json['date'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      weddingDate: json['wedding_date'],
      address: json['address'],
      packName: json['packName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pack': packId,
      'date': date,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'wedding_date': weddingDate,
      'address': address,
      'packName': packName,
    };
  }

  add(){
    //final MembreControllerHive projetController = Get.find();
    final ReservationHiveController projetController = Get.put(ReservationHiveController());
    List datas = projetController.datas;
    datas.add(this);
    ReservationBox().putDatas(datas);
    //Get.off(() => ListMembreHivePage());
    // Get.back();
    // Get.back();
    Get.snackbar("Ajout", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  delete() async {
    final ReservationHiveController projetController = Get.put(ReservationHiveController());
    List datas = projetController.datas;
    datas.remove(this);
    ReservationBox().putDatas(datas);
    Get.snackbar("Delete", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  edit(ReservationHiveModel obj){
    //this.designation = obj.designation;
    packId = obj.packId;
    date = obj.date;
    firstName = obj.firstName;
    lastName = obj.lastName;
    phoneNumber = obj.phoneNumber;
    date = obj.date;
    weddingDate = obj.weddingDate;
    address = obj.address;
    packName = obj.packName;

    final ReservationHiveController projetController = Get.put(ReservationHiveController());
    List datas = projetController.datas;
    //datas[id!] = this;
    ReservationBox().putDatas(datas);
    //Get.off(() => DetailMembrePage());
    Get.snackbar("Edit", "Success", snackPosition: SnackPosition.BOTTOM);

  }
}

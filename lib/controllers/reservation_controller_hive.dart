
import 'package:furuplus/boxs/reservation_box.dart';
import 'package:get/get.dart';



class ReservationHiveController extends GetxController{

  Rx<String> currentObjectSelected = ''.obs;
  //Rx<List<MembreModel>> currentProjetModel = [].obs;

  List _datas = ReservationBox().getDatas();

  List get datas => _datas;

  setDatas(List newData){
    _datas = newData;
    update();
  }

}

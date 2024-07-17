// controllers/pack_controller.dart

import 'package:furuplus/models/pack_model.dart';
import 'package:furuplus/services/api_services.dart';
import 'package:get/get.dart';


class PackController extends GetxController {
  var packs = <Pack>[].obs;
  var isLoading = true.obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchPacks();
    super.onInit();
  }

  Future<void> fetchPacks() async {
    try {
      isLoading(true);
      var fetchedPacks = await _apiService.fetchPacks();
      packs.value = fetchedPacks;
    } finally {
      isLoading(false);
    }
  }
}

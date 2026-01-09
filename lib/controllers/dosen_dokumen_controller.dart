import 'package:get/get.dart';
import '../services/dokumen_service.dart';

class DokumenDosenController extends GetxController {
  // loading for mahasiswa
  final isLoadingMahasiswa = false.obs;

  // loading for dokumen
  final isLoadingDokumen = false.obs;

  final mahasiswaList = <Map<String, dynamic>>[].obs;
  final dokumenList = <Map<String, dynamic>>[].obs;

  Future<void> fetchMahasiswa() async {
    try {
      isLoadingMahasiswa.value = true;
      final result = await DokumenService.getMahasiswaList();
      mahasiswaList.assignAll(
        List<Map<String, dynamic>>.from(result.map((e) => e as Map<String, dynamic>)),
      );
    } catch (e) {
      mahasiswaList.clear();
      Get.snackbar('Error', 'Gagal memuat data mahasiswa', snackPosition: SnackPosition.TOP);
    } finally {
      isLoadingMahasiswa.value = false;
    }
  }

  Future<void> fetchDokumenMahasiswa({required int mahasiswaId, required String status}) async {
    try {
      isLoadingDokumen.value = true;
      final result = await DokumenService.getDokumenMahasiswa(
        mahasiswaId: mahasiswaId,
        status: status,
      );
      dokumenList.assignAll(
        List<Map<String, dynamic>>.from(result.map((e) => e as Map<String, dynamic>)),
      );
    } catch (e) {
      dokumenList.clear();
      Get.snackbar('Error', 'Gagal memuat dokumen mahasiswa', snackPosition: SnackPosition.TOP);
    } finally {
      isLoadingDokumen.value = false;
    }
  }
}

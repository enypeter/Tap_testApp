import 'package:get/get.dart';
import 'package:tap_design/model/bio_model.dart';
import 'package:tap_design/model/category_model.dart';
import 'package:tap_design/service/api_services.dart';

class AppController extends GetxController {
  List<BioModel> bioListItem = [];
  List<CategoryModel> interestListItem = [];

  getBio() async {
    // if (bioListItem.isNotEmpty) {
      var response = await ApiDocs.getMyProfile();
      if (response['status'] != 'success') {
        print('failed');
        bioListItem = [];
      } else {
        var profileData = response['data']['profile'];
        bioListItem = profileData
            .map<BioModel>((json) => BioModel.fromJson(json))
            .toList();
      }
    // }
    return bioListItem;
  }

  getInterests() async {
    // if (interestListItem.isNotEmpty) {
      var response = await ApiDocs.getCategories();
      if (response['status'] != 'success') {
        print('failed');
        interestListItem = [];
      } else {
        var categoryData = response['data'];
        interestListItem = categoryData;
      }
    // }
    return interestListItem;
  }
}

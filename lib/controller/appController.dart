import 'package:get/get.dart';
import 'package:tap_design/model/bio_model.dart';
import 'package:tap_design/service/api_services.dart';

class AppController extends GetxController {
var bioListItem;
var interestListItem = [];

  getBio() async {
    // if (bioListItem.isNotEmpty) {
      var response = await ApiDocs.getMyProfile();
      if (response['status'] != 'success') {
        print('failed');
        bioListItem = [];
      } else {
        var profileData = response['data'];
        print(profileData);
        bioListItem = profileData;
      }
    // }
    return bioListItem;
  }

  getInterests() async {
    if (interestListItem.isNotEmpty) {
      var response = await ApiDocs.getCategories();
      if (response['status'] != 'success') {
        print('failed');
        interestListItem = [];
      } else {
        var categoryData = response['data']['interests'];
        interestListItem = categoryData;
      }
    }
    return interestListItem;
  }
}

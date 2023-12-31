import 'package:flutter/material.dart';
import 'package:gov_services_app/modules/utils/global_gov_service_list.dart';
import 'package:gov_services_app/modules/view/home_page/model/gov_service_model.dart';

class GovermentServiceProvider extends ChangeNotifier {
  List<GovServiceModel> govServiceData = [];

  getData() {
    govServiceData = globalGovData.map((e) {
      return GovServiceModel(
        name: e['name'],
        logo: e['logo'],
        link: e['link'],
      );
    }).toList();
  }
}

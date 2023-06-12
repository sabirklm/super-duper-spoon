import 'package:flutter/material.dart';

import '../model/exploration_fact.dart';
import '../service/constant.dart';
import '../service/provider.dart';

class ExplorationFactProvider with ChangeNotifier {
  List<ExplorationFact> data = [];
  bool isFactsloading = false;

  init() async {
    fetchData();
    getCrew();
    //_scrapImages();
  }

  void fetchData() async {
    isFactsloading = true;
    var temp = await HttpProvider().getAPI(api: HttpConstants.ROCKET_API);
    if (temp is List) {
      var tempList = temp
          .map(
            (e) => ExplorationFact(
              title: e["name"],
              desc: e["description"],
              imgUrl: e["flickr_images"],
            ),
          )
          .toList();
      data = tempList;
    }
    await Future.delayed(const Duration(seconds: 3));
    isFactsloading = false;
    notifyListeners();
  }

  getCrew() async {
    var temp = await HttpProvider().getAPI(api: HttpConstants.CREW_API);
    if (temp is List) {
      print(temp.map((e) => e));
      var tempData = temp
          .map(
            (e) => ExplorationFact(
              title: e["name"],
              desc: e["agency"],
              imgUrl: [e["image"]],
            ),
          )
          .toList();
      data.addAll(tempData);
    }
  }

  _scrapImages() async {
    var temp = await HttpProvider().scrapeImageUrls("http://yandex.com/");
    print(temp);
  }
}

class HomeProvider with ChangeNotifier {
  List<dynamic> homeData = [];

  init() async {
    _getHomeData();
  }

  _getHomeData() async {
    var temp = await HttpProvider().getAPI(api: HttpConstants.CREW_API);
    homeData = temp;
    notifyListeners();
  }
}

import 'package:e_com/model/onboard_model/onboard_model.dart';

class OnBoardViewModel {
  static final List<OnBoardModel> onBoardModelList = <OnBoardModel>[
    OnBoardModel(
        title: "Easy Access to Bikes",
        desc: "GOride is now available for\nyour near by places",
        img_src: "assets/onboard/3.jpg"),
    OnBoardModel(
        title: "Low Budget",
        desc: "GOride is now available for\nyour near by places",
        img_src: "assets/onboard/5.png"),
    OnBoardModel(
        title: "Earn Rewards",
        desc: "GOride is now providing\nrewards points for your rides",
        img_src: "assets/onboard/3.jpg"),
  ];
}

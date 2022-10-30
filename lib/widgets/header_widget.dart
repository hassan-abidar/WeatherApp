import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatheraoo_/controller/GlobalController.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAdress(GlobalController().getLattitude().value,
        GlobalController().getLongitude().value);
    super.initState();
  }

  getAdress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(city),
        )
      ],
    );
  }
}

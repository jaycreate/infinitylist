import 'package:get/get.dart';
import 'package:location/location.dart';

class GpsController extends GetxController {
  Location location = Location();
  double latitude = 0.00;
  double longitude = 0.00;

  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();

    initLocation();
  }

  initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.enableBackgroundMode(enable: false);
    location.onLocationChanged.listen((LocationData currentLocation) {
      // print(currentLocation);
      latitude = double.parse(currentLocation.latitude.toString());
      longitude = double.parse(currentLocation.longitude.toString());
      isInitialized(true);
      update();
    });
  }
}

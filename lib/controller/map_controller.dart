import 'package:get/get.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  Location location = new Location();
  double latitude = 0.00;
  double longitude = 0.00;

  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();

    initLocation();
  }

  initLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

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

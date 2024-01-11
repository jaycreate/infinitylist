import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  static const LatLng sourceLocation = LatLng(13.93236, 100.5291093);
  static const LatLng destination = LatLng(13.8999571, 100.5403802);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Map Location",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.grey[100],
            elevation: 0.3,
            centerTitle: false,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black87,
                  ))
            ],
          ),
          body: GetBuilder<MapController>(
              init: MapController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.isInitialized.value
                      ? Column(
                          children: [
                            Row(
                              children: [
                                const Text("Lat : "),
                                Text(controller.latitude.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Lon : "),
                                Text(controller.longitude.toString()),
                              ],
                            ),
                          ],
                        )
                      : const Center(
                          child: SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                            strokeWidth: 2,
                          ),
                        )),
                );
              })

          // GoogleMap(
          //   initialCameraPosition: const CameraPosition(
          //     target: sourceLocation,
          //     zoom: 13.5,
          //   ),
          //   polylines: {
          //     const Polyline(
          //       polylineId: PolylineId('l1'),
          //     ),
          //   },
          //   markers: {
          //     const Marker(markerId: MarkerId('p1'), position: sourceLocation),
          //     const Marker(markerId: MarkerId('p2'), position: destination)
          //   },
          // ),
          ),
    );
  }
}

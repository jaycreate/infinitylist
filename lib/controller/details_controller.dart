import 'package:get/get.dart';

class DetailsController extends GetxController {
  var sampleData = "Sample data from detailController.";
  var ctn = 0;
  var pack = 0;
  var pcs = 0;

  increaseOrder(String unit) {
    // print(unit);
    switch (unit) {
      case 'CTN':
        ctn++;
        break;
      case 'PACK':
        pack++;
        break;
      case 'PCS':
        pcs++;
        break;
    }
    update();
  }

  decreaseOrder(String unit) {
    switch (unit) {
      case 'CTN':
        ctn--;
        if (ctn < 0) ctn = 0;
        break;
      case 'PACK':
        pack--;
        if (pack < 0) pack = 0;
        break;
      case 'PCS':
        pcs--;
        if (pcs < 0) pcs = 0;
        break;
    }
    update();
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../widgets/widgets.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page ${Get.arguments[0]}",
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                // color: Colors.black87,
              ))
        ],
      ),
      body: GetBuilder<DetailsController>(
          init: DetailsController(),
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey[200],
                              width: 150,
                              height: 150,
                              child: CachedNetworkImage(
                                imageUrl: Get.arguments[1],
                                placeholder: (context, url) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.grey,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  // This was the reason for exception being triggered and rendered!
                                  return const Center(
                                    child: Text(
                                      'Error',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(controller.sampleData),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      orderCount("CTN", controller, context),
                      orderCount("PACK", controller, context),
                      orderCount("PCS", controller, context),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 15,
                          bottom: 15,
                        ),
                        child: AppTextInput(
                          hintText: lang(context, 'account_info'),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.clear,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 15),
                  child: AppButton(
                    "Save & Close",
                    onPressed: () => Get.back(),
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget orderCount(String title, DetailsController controller, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          Card(
            elevation: 0,
            // color: Colors.blue.shade800,
            color: Theme.of(context).dividerColor.withOpacity(0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    controller.decreaseOrder(title);
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  alignment: Alignment.centerRight,
                  width: 55,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: orderQty(title, controller),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.increaseOrder(title);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderQty(String title, DetailsController controller) {
    var orderQty = 0;
    switch (title) {
      case 'CTN':
        orderQty = controller.ctn;
        break;

      case 'PACK':
        orderQty = controller.pack;
        break;

      case 'PCS':
        orderQty = controller.pcs;
        break;
    }

    return Text(
      orderQty.toString(),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

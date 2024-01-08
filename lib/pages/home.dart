import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor: Colors.grey[100],
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              onScroll(controller);
              return Column(children: [
                // Header section
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    alignment: Alignment.bottomCenter,
                    height: 170,
                    decoration: BoxDecoration(color: Colors.blue.shade800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Infinity List",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Page: ${controller.page - 1}",
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    icon: Stack(
                                      children: const [
                                        Icon(
                                          Icons.notifications,
                                          size: 28,
                                          color: Colors.white,
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 3.5,
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.refreshData();
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: controller.listData.length,
                      itemBuilder: (context, index) {
                        return itemList(
                          controller.listData[index].no.toString(),
                          controller.listData[index].fullName,
                          controller.listData[index].companyName,
                          controller.listData[index].imageUrl,
                        );
                      },
                    ),
                  ),
                )
              ]);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: scrollUp(),
        // bottomNavigationBar: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       boxShadow: [
        //         BoxShadow(
        //           blurRadius: 20,
        //           color: Colors.black.withOpacity(.1),
        //         )
        //       ],
        //     ),
        //     child: SafeArea(
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        //         child: GNav(
        //           rippleColor: Colors.grey[300]!,
        //           hoverColor: Colors.grey[100]!,
        //           gap: 8,
        //           activeColor: Colors.black,
        //           iconSize: 24,
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        //           duration: const Duration(milliseconds: 400),
        //           tabBackgroundColor: Colors.grey[100]!,
        //           color: Colors.black,
        //           tabs: const [
        //             GButton(
        //               icon: Icons.home,
        //               text: 'Home',
        //             ),
        //             GButton(
        //               icon: Icons.message,
        //               text: 'Message',
        //             ),
        //             GButton(
        //               icon: Icons.search,
        //               text: 'Search',
        //             ),
        //             GButton(
        //               icon: Icons.settings,
        //               text: 'Settings',
        //             ),
        //           ],
        //           selectedIndex: 0,
        //           onTabChange: (index) {},
        //         ),
        //       ),
        //     )),
      ),
    );
  }

  Widget scrollUp() {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(0.5),
        child: const Icon(Icons.arrow_upward),
        onPressed: () {
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        });
  }

  onScroll(controller) {
    _scrollController.addListener(() async {
      var position = _scrollController.position.pixels;
      if (position >= _scrollController.position.maxScrollExtent - 120) {
        // The preventCall to avoid call API many times.
        if (!controller.preventCall) {
          controller.fetchData().then((_) => controller.preventCall = false);
          controller.preventCall = true;
        }
      }
    });
  }

  Widget itemList(no, title, subtitle, imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 45,
                  height: 45,
                  child: // Container(),
                      CachedNetworkImage(
                    imageUrl: imageUrl,
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
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: no + ". " + title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed("/details", arguments: [no, imageUrl]);
                },
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade500,
                ))
          ],
        ),
      ),
    );
  }
}

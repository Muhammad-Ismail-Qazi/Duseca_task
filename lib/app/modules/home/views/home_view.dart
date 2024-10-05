import 'package:duseca_task_2/app/components/custom_button.dart';
import 'package:duseca_task_2/app/components/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart'; // Added speed_dial_fab package

import '../../../constants/spaces.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Wrap the entire tab content in Expanded
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFF5E5E5E),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      dividerColor: Colors.transparent,
                      indicatorPadding: EdgeInsets.only(right: 0),
                      padding: EdgeInsets.all(0),
                      indicatorColor: Colors.black12,
                      tabs: [
                        Tab(text: 'Events'),
                        Tab(text: 'Teams'),
                        Tab(text: 'Tasks'),
                        Tab(text: 'Equipment'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Obx(()=>controller.events.isEmpty?Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  textEditingController: controller.searchController,
                                  label: 'Search',
                                  sufIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search),
                                  ),
                                ),
                                Spaces.y5,
                                Text(
                                  "Add a new Event",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spaces.y1,
                                const Text(
                                  "Invite the new location, Admins to their new events and management app ",
                                ),
                              ],
                            ),
                          ):
                          //otherwise
                            ListView.builder(
                              itemCount: controller.events.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.events[index].eventName.toString()),
                                  leading: Icon(Icons.image),
                                  subtitle: Column(
                                    children: [
                                      Text(controller.events[index].description.toString()),
                                      Text(controller.events[index].location.toString()),
                                      Text(controller.events[index].date.toString()+ controller.events[index].time.toString())
                                    ],
                                  ),
                                );
                              },
                            )
                          ),
                          const Center(child: Text("Teams Tab Content")),
                          const Center(child: Text("Tasks Tab Content")),
                          const Center(child: Text("Equipment Tab Content")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating button and other content below the tab
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpeedDialFabWidget(
                  primaryBackgroundColor: Colors.black,
                  primaryForegroundColor: Colors.white,
                  secondaryIconsList: const [
                    Icons.event,
                    Icons.task,
                    Icons.person,
                    Icons.message,
                  ],
                  secondaryIconsText: const [
                    "Create Event",
                    "Create Task",
                    "Team Invite",
                    "New message",
                  ],
                  secondaryIconsOnPress: [
                        () => Get.toNamed('/create-event'),
                        () => print("Create Task Pressed"),
                        () => print("Team Invite Pressed"),
                        () => print("Team Invite Pressed"),
                  ],
                ),
              ],
            ),
            Spaces.y1,
            const Text("All you need is the email address"),
            Spaces.y1,
            CustomButton(
              text: 'Invite admin',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
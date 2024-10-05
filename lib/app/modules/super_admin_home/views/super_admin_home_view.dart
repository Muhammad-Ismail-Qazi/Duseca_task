import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/super_admin_home_controller.dart';

class SuperAdminHomeView extends GetView<SuperAdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuperAdminHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SuperAdminHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

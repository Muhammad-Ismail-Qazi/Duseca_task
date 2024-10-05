import 'package:get/get.dart';

import '../controllers/super_admin_home_controller.dart';

class SuperAdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuperAdminHomeController>(
      () => SuperAdminHomeController(),
    );
  }
}

import 'package:duseca_task_2/app/components/custom_button.dart';
import 'package:duseca_task_2/app/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/spaces.dart';
import '../controllers/create_event_controller.dart';

class CreateEventView extends GetView<CreateEventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a New Event'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Event Name, Description, Instruction
              CustomTextField(
                  textEditingController: controller.eventNameController,
                  label: 'Event Name'),
              Spaces.y1,
              CustomTextField(
                  textEditingController: controller.descriptionController,
                  label: 'Description'),
              Spaces.y1,
              CustomTextField(
                  textEditingController: controller.instructionController,
                  label: 'Instruction'),
              Spaces.y2,

              // Date and Time Picker (in a Row)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Obx(
                              () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(controller.selectedDate.value.isEmpty
                                  ? 'Select Date'
                                  : controller.selectedDate.value),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spaces.x2,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectTime(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Obx(
                              () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(controller.selectedTime.value.isEmpty
                                  ? 'Select Time'
                                  : controller.selectedTime.value),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spaces.y2,

              // Location Input
              CustomTextField(
                  textEditingController: controller.locationController,
                  label: 'Location'),
              Spaces.y2,

              // Get Current Location Button
              GestureDetector(
                onTap: controller.getCurrentLocation,
                child: Row(
                  children: [
                    const Icon(Icons.my_location, color: Colors.blue),
                    Spaces.x2,
                    const Text(
                      'Get Current Location',
                    ),
                  ],
                ),
              ),
              Spaces.y5,

              // Upload PDF and Next Button
              CustomButton(
                text: 'Upload PDF',
                onPressed: controller.uploadPDF,
              ),
              Spaces.y2,

              CustomButton(
                text: 'Confirm & Next',
                onPressed: controller.confirmAndNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:duseca_task_2/app/models/event_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../../constants/firebase.dart'; // for formatting dates and times

class CreateEventController extends GetxController {
  final eventNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final instructionController = TextEditingController();
  final locationController = TextEditingController();

  var selectedDate = ''.obs;
  var selectedTime = ''.obs;
  var _fileURL;

  var isLoading = false.obs;

  // Function to select a date
  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      selectedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  // Function to select time
  void selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime.format(context);
    }
  }

  // Simulating getting the current location
  void getCurrentLocation() {
    // Simulated current location (Replace this with actual location service)
    locationController.text = '123 Main St, Springfield';
  }

  // Function to select and upload a PDF
  Future<void> uploadPDF() async {
    FilePickerResult? pickedFile = await pickPdf(); // Pick the PDF file

    if (pickedFile != null) {
      await uploadPdf(pickedFile.files.first);
    } else {
      Get.snackbar("Error", "No PDF file selected.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Confirm and proceed to next step
  void confirmAndNext() {
    try {
      final eventModel = EventModel(
        eventName: eventNameController.text,
        description: descriptionController.text,
        instructions: instructionController.text,
        date: selectedDate.value,
        time: selectedTime.value,
        location: locationController.text,
        fileUrl: _fileURL, // Include the file URL here
      );

      eventCollection.add(eventModel.toMap()).then((value) {
        Get.snackbar('Confirmed', 'Event information saved!');
      });

    } catch (ex) {
      Get.snackbar("Error", "Failed to save event: $ex",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // This method picks a PDF file from the device
  Future<FilePickerResult?> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result;
    } else {
      return null;
    }
  }

  Future<void> uploadPdf(PlatformFile pickedFile) async {
    try {
      isLoading(true);
      final storageRef = firebaseStorage.ref()
          .child('pdfs/${pickedFile.name}'); // Create a reference in Firebase Storage

      // Upload the file
      final uploadTask = storageRef.putFile(
        File(pickedFile.path!),
        SettableMetadata(contentType: 'application/pdf'),
      );
      final snapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await snapshot.ref.getDownloadURL(); // Get the download URL

      // Store the URL for later use in EventModel
      _fileURL = downloadUrl;

      Get.snackbar("Success", "PDF uploaded successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Failed to upload PDF: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    eventNameController.dispose();
    descriptionController.dispose();
    instructionController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
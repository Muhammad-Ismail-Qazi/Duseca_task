import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duseca_task_2/app/constants/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/event_model.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  // Observable list for storing fetched events
  var events = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  // Fetch events from Firestore in real-time
  void fetchEvents() {
    eventCollection.snapshots().listen((querySnapshot) {
      events.clear();  // Clear the existing list to avoid duplicates
      for (var document in querySnapshot.docs) {
        final event = EventModel.fromMap(document.data() as Map<String, dynamic>);
        events.add(event);
      }
    });
  }
}
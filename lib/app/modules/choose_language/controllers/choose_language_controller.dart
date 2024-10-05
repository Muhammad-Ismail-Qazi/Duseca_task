import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duseca_task_2/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/firebase.dart';

class ChooseLanguageController extends GetxController {

  RxString selectedLanguage = 'English (US)'.obs;

  final searchController = TextEditingController();
  final List<String> languages = [
    'English (US)',
    'Italian (IT)',
    'Chinese (Simplified CN)',
    'French (FR)',
    'German (DE)',
    'Spanish (ES)',
    'Russian (RU)',
  ];


  void selectLanguage(String language) {
    selectedLanguage.value = language;
    update();
  }

  Future<void> addUserLanguage() async{
    try{


      final userModel = UserModel(language: selectedLanguage.value);

      userCollection.add(userModel.toMap()).then((value)=>{
        Get.snackbar('Success', "Successfully selected language"),
        Get.toNamed('/login')
      });
    }
    catch(exception){
      throw exception.toString();
    }
  }

}
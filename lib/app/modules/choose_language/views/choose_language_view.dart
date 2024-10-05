import 'package:country_flags/country_flags.dart';
import 'package:duseca_task_2/app/components/custom_button.dart';
import 'package:duseca_task_2/app/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/spaces.dart';
import '../controllers/choose_language_controller.dart';

class ChooseLanguageView extends GetView<ChooseLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Choose Your Language ',
                style: TextStyle(fontSize: 20.sp),
              ),
              Spaces.y2,
              const Text(
                'Please search and then choose your personal language.',
              ),
              CustomTextField(
                  label: 'search',
                  textEditingController: controller.searchController,
                  preIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {}, // Implement search functionality here
                  )),
              Spaces.y2,
              ListView.builder(
                shrinkWrap: true, // Makes the list shrink-wrap its content
                itemCount: controller.languages.length,
                itemBuilder: (context, index) {
                  final language = controller.languages[index];
                  final languageCode = language.split('(')[1].substring(0, 2);
                  return Obx(
                        () => ListTile(
                      onTap: () => controller.selectLanguage(language),
                      selected: controller.selectedLanguage.value == language,
                      selectedTileColor: Colors.green[100], // Highlight color for selected
                      leading: CountryFlag.fromCountryCode(languageCode),
                      title: Text(
                        language,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      trailing: controller.selectedLanguage.value == language
                          ? const Icon(Icons.check)
                          : null,
                    ),
                  );
                },
              ),
              CustomButton(text: 'Continue', onPressed: (){
                controller.addUserLanguage();
              })
            ],
          ),
        ),
      ),
    );
  }
}
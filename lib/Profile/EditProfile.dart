import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:divya_shravya/Profile/model/user.dart';
import 'package:divya_shravya/Profile/utils/user_preferences.dart';
import 'package:divya_shravya/Profile/widget/appbar_widget.dart';
import 'package:divya_shravya/profile/widget/button_widget.dart';
import 'package:divya_shravya/profile/widget/profile_widget.dart';
import 'package:divya_shravya/Profile/widget/textfield_widget.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
   late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) =>
        Scaffold(
        body:
         ListView(

          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height:40,
            ),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {

                final image = await ImagePicker()
                    .getImage(source:  ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage =
                await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),

            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                UserPreferences.setUser(user);
                Get.back();

              },
            ),
          ],
        )
        );


}

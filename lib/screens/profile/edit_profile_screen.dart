import 'package:flutter/material.dart';
import 'package:recipebook/models/user.dart';
import 'package:recipebook/utils/user_preferences.dart';
import 'package:recipebook/widget/buildAppBarWidget.dart';
import 'package:recipebook/widget/buildElevatedButton.dart';
import 'package:recipebook/widget/buildProfileImageWidget.dart';
import 'package:recipebook/widget/buildTextFieldWidget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Edit Profile Page", true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileImageWidget(
            imagePath: UserPreferences.myUser.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: "Full Name",
            text: UserPreferences.myUser.name,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: "E-Mail",
            text: UserPreferences.myUser.email,
            onChanged: (email) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: "About",
            maxLines: 5,
            text: UserPreferences.myUser.about,
            onChanged: (about) {},
          ),
          SizedBox(
            height: 24,
          ),
          buildElevatedButton("Profil kaydet", null),
        ],
      ),
    );
  }
}

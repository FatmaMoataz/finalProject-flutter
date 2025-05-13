import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task4/profile/user_model.dart';
import '../profile_widget/options.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: toggleTheme,
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.grey,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 10,),
          Center(
            child: Consumer<UserModel>(
              builder: (context, userModel, child) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade500,
                      radius: 100,
                      child: userModel.user?.image == null
                          ? const Icon(
                              Icons.person,
                              size: 200,
                              color: Colors.white38,
                            )
                          : ClipOval(
                              child: Image.file(
                                userModel.user!.image!,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 150,
                              child: Column(
                                children: [
                                  const Text(
                                    'Profile',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Options(
                                        onPressed: () {
                                          userModel.imageSelector(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        title: 'Camera',
                                        icon: Icons.camera_alt,
                                      ),
                                      Options(
                                        onPressed: () {
                                          userModel.imageSelector(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        title: 'Gallery',
                                        icon: Icons.image,
                                      ),
                                      if (userModel.user?.image != null)
                                        Options(
                                          selectedImage: userModel.user?.image,
                                          onPressed: () {
                                            userModel.removeImage();
                                            Navigator.pop(context);
                                          },
                                          title: 'Delete',
                                          icon: Icons.delete,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

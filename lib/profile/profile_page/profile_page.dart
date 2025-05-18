import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task4/authentication/login/login_screen.dart';
import 'package:task4/profile/user_model.dart';
import '../../authentication/user_model.dart';
import '../profile_widget/edit_listtile.dart';
import '../profile_widget/options.dart';
import 'package:task4/dark_theme_model/dark_theme_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false).logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadUser();
  }

  Future<void> _showEditDialog({
    required BuildContext context,
    required String title,
    required String currentValue,
    required Function(String) onSave,
  }) async {
    final TextEditingController controller = TextEditingController(text: currentValue);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $title'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: title),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final userModel = Provider.of<UserModel>(context);

    return Scaffold(
      backgroundColor: themeProvider.darkTheme ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.darkTheme ? Colors.black : Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: themeProvider.darkTheme ? Colors.white : Colors.black,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Icon(
                  themeProvider.darkTheme ? Icons.dark_mode : Icons.light_mode,
                  color: themeProvider.darkTheme ? Colors.white : Colors.black,
                ),
                Switch(
                  value: themeProvider.darkTheme,
                  onChanged: (val) {
                    themeProvider.darkTheme = val;
                  },
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.grey,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: themeProvider.darkTheme ? Colors.white : Colors.black,
                  ),
                  onPressed: () => _logout(context),
                  tooltip: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),
          Center(
            child: Stack(
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
                      :  ClipOval(
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
                        builder: (context) => SizedBox(
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
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              EditText(
                title: 'Name',
                subtitle: userProvider.name ?? '',
                onTap: () {
                  _showEditDialog(
                    context: context,
                    title: 'Name',
                    currentValue: userProvider.name ?? '',
                    onSave: (val) {
                      userProvider.updateName(val);
                    },
                  );
                },
              ),
              EditText(
                title: 'Email',
                subtitle: userProvider.email ?? '',
                onTap: () {
                  _showEditDialog(
                    context: context,
                    title: 'Email',
                    currentValue: userProvider.email ?? '',
                    onSave: (val) {
                      userProvider.updateEmail(val);
                    },
                  );
                },
              ),
              EditText(
                title: 'Bio',
                subtitle: userModel.user?.bio ?? 'code eat sleep repeat',
                onTap: () {
                  _showEditDialog(
                    context: context,
                    title: 'Bio',
                    currentValue: userModel.user?.bio ?? 'code eat sleep repeat',
                    onSave: (val) {
                      userModel.updateBio(val);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

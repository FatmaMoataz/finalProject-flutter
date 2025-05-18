import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/profile/profile_page/profile_page.dart';
import 'package:task4/add_item/add_item_screen.dart';
import 'package:task4/details/details_widget/favorite.dart';
import '../../add_item/item_model.dart';
import '../../profile/user_model.dart';
import '/details/details_widget/details_widget.dart';
import 'package:task4/dark_theme_model/dark_theme_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.darkTheme ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.darkTheme ? Colors.black : Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: profileImage == null
                ? Icon(
              Icons.account_box,
              color: themeProvider.darkTheme ? Colors.white : Colors.white,
            )
                : CircleAvatar(
              child: ClipOval(
                child: Image.file(
                  profileImage,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "The ${items.selectedItem?.title}",
          style: TextStyle(
            color: themeProvider.darkTheme ? Colors.white : Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(
              items.selectedItem!.images.first,
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(index: items.items.indexOf(items.selectedItem!)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: themeProvider.darkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                items.selectedItem!.body,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: themeProvider.darkTheme ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.selectedItem!.images.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    items.selectedItem!.images[index],
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeProvider.darkTheme ? Colors.grey[800] : Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemScreen()),
          );
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'item_model.dart';
import 'package:task4/dark_theme_model/dark_theme_model.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: themeProvider.darkTheme ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: themeProvider.darkTheme ? Colors.white : Colors.black,
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
          color: themeProvider.darkTheme ? Colors.black54 : null,
        ),
        child: Consumer<ItemModel>(
          builder: (context, itemModel, child) => ListView(
            children: [
              const SizedBox(height: 30),
              itemModel.selectedImage!.isEmpty
                  ? Container(
                color: Colors.white38,
                height: 150,
                width: MediaQuery.sizeOf(context).width - 20,
                child: IconButton(
                  onPressed: () {
                    itemModel.imageSelector();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: themeProvider.darkTheme ? Colors.white : Colors.black,
                  ),
                ),
              )
                  : Row(
                children: [
                  Container(
                    color: Colors.white38,
                    height: 100,
                    width: 100,
                    child: IconButton(
                      onPressed: () {
                        itemModel.imageSelector();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: themeProvider.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width - 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: itemModel.selectedImage!
                          .map(
                            (file) => Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.file(
                                file,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.cancel),
                                color: themeProvider.darkTheme ? Colors.red : Colors.grey,
                                onPressed: () {
                                  itemModel.removeImage(
                                    itemModel.selectedImage!.indexOf(file),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  style: TextStyle(
                    color: themeProvider.darkTheme ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: themeProvider.darkTheme ? Colors.white70 : Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.darkTheme ? Colors.white54 : Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.darkTheme ? Colors.white : Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: body,
                  minLines: 3,
                  maxLines: 7,
                  style: TextStyle(
                    color: themeProvider.darkTheme ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Body',
                    hintStyle: TextStyle(
                      color: themeProvider.darkTheme ? Colors.white70 : Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.darkTheme ? Colors.white54 : Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.darkTheme ? Colors.white : Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeProvider.darkTheme ? Colors.grey[800] : Colors.blue,
        child: const Icon(Icons.save),
        onPressed: () {
          final itemModel = Provider.of<ItemModel>(context, listen: false);
          itemModel.addItem(
            Item(
              images: List.from(itemModel.selectedImage!),
              title: title.text,
              body: body.text,
              favorite: false,
            ),
          );
          itemModel.selectedImage!.clear();
          itemModel.notifyListeners();

          Navigator.pop(context);
        },
      ),
    );
  }
}

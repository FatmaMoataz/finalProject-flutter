import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/favorite/favorite_model.dart';
import 'package:task4/dark_theme_model/dark_theme_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.darkTheme ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.darkTheme ? Colors.black : Colors.blue,
        title: Text(
          'Favorite',
          style: TextStyle(
            color: themeProvider.darkTheme ? Colors.white : Colors.white,
          ),
        ),
      ),
      body: Consumer<FavoriteModel>(
        builder:(context,fav,child)=>
         GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10)
          ,  itemCount: fav.fav.length
             , itemBuilder: (context,index){

            return SizedBox(child: Column(
            children: [
            Image.file(fav.fav[index].images.first, height: 125, width: 125, fit:BoxFit.cover),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(fav.fav[index].title),
                    IconButton(onPressed: () {
                      fav.fav[index].favorite=false;
            fav.remove(fav.fav[index]);
                    }, icon: Icon(Icons.favorite),color: Colors.red,)
            ],
            )
            ],
            ),);
            })
      ),

    );
  }
}

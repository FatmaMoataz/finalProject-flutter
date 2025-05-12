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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Column(children: [
        Center(child: Consumer <UserModel> (
          builder: (context,UserModel,child)  {
        return  Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 100 ,child:
               UserModel.user?.image == null?
                 Icon(Icons.person, size: 200,color: Colors.white38,) : ClipOval(child: Image.file(
                 height: 200,
                 width: 200, 
                  fit: BoxFit.cover,           
                  UserModel.user!.image!))
                 ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 25,
              child: IconButton(onPressed: (){
                showModalBottomSheet(context: context, builder: (context) => Container(
                  height: 150,
                  child: Column(children: [Text('Profile', style: TextStyle(fontSize: 25),),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Options(
                     onPressed:(){
                     UserModel.imageSelector(ImageSource.camera);
                      Navigator.pop(context);
                     } ,
                      title: 'Camera',
                       icon: Icons.camera_alt,),
                   Options( 
                    onPressed:(){ UserModel.imageSelector(ImageSource.gallery);
                    Navigator.pop(context);
                    } ,
                    title: 'Gallery',
                     icon: Icons.image,),
                   if( UserModel.user?.image != null)  
                    Options( 
                      selectedImage: UserModel.user?.image,
                      onPressed:(){
  UserModel.removeImage();
          Navigator.pop(context);
                    } ,title: 'Delete', icon: Icons.delete,),
                   
                   ],
                    )],
                    ),
                ));
              }, icon: Icon(
                color: Colors.grey,
                Icons.camera_alt, size: 40,)))
            ],
          );
          },

        ))
      ],),
    );  
  }
}


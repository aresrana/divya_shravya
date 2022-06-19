

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../SideNavbr/CustomDrawer.dart';
import 'package:divya_shravya/Profile/EditProfile.dart';
import 'package:divya_shravya/Profile/model/user.dart';
import 'package:divya_shravya/Profile/utils/user_preferences.dart';



class MusicList extends StatefulWidget {
  const MusicList({ Key? key}) : super(key: key);

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  final user = UserPreferences.getUser();
  TextEditingController _getVin = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.white60,
        endDrawerEnableOpenDragGesture: false,
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              'AutoMedis',
              style: TextStyle(color: Colors.yellow),
            ),
            leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.yellow,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
            actions: [
              IconButton(
                icon: Icon(Icons.person, color: Colors.yellow),
                onPressed: () {},
              )
            ]),
        body : Container (

          child: Text ("ares"),
        ),
        drawer: Container (
        width: MediaQuery.of(context).size.width*0.45,
         child: Drawer(
            child: ListView(children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.yellow, Colors.green]),
                    // image:DecorationImage(
                    //   fit:BoxFit.fill,
                    //   image:AssetImage('images/launch_image.png')
                    // )
                  ),
                  child:
                    Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(user.imagePath,
                                    //height: 80, width: 80
                                  ),

                            ),


                        ),

                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(user.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        Center(
                        child: TextButton.icon(
                          onPressed: () {
                               Get.to(EditProfilePage());
                            },
                          icon:Icon(Icons.ac_unit_sharp,size:24.0),
                          label: Text('Edit Profile',
                            style: TextStyle(decoration: TextDecoration.underline),)

                        )),
                      ],
                    ),
                  )),
              CustomDrawer(Icons.favorite, 'Favorite', () => {}),
              CustomDrawer(Icons.share, 'Share', () => {}),
              CustomDrawer(Icons.settings, 'Settings', () => {}),
              CustomDrawer(Icons.star, 'Rate', () => {}),
              CustomDrawer(Icons.arrow_left, 'Back', () => Get.back()),
            ]))));
  }
}

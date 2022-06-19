import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../BottomNavBar/DashBoard.dart';
import '../BottomNavBar/MusicList.dart';
import '../BottomNavBar/AlbumListScreen.dart';
import '../AudioControls/assa.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = new PageController();

  GlobalKey navigationKey = GlobalKey();

  // FSBStatus drawerStatus;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          //  MoveToBackground.moveTaskToBack();
          return false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset:false,
          floatingActionButton: PlayerControls(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            height: 60,
            backgroundColor: Colors.white,
            animationCurve: Curves.linearToEaseOut,
            animationDuration: Duration(milliseconds: 300),
            buttonBackgroundColor: Colors.green,   //deepPurple,
            color: Colors.green,//Colors.deepPurple,
            index: 0,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            items: <Widget>[
              Icon(Icons.home ,
                  size: _size.height > 650 ? 30 : 25, color: Colors.white),
                            Icon(Icons.library_music ,
                  size: _size.height > 650 ? 30 : 25, color: Colors.white),
              Icon(Icons.person,
                 size: _size.height > 650 ? 30 : 25, color: Colors.white),
             // Icon(Icons.account_box_rounded,
                //  size: _size.height > 650 ? 30 : 25, color: Colors.white),
             // Icon(Icons.playlist_play,
                //  size: _size.height > 650 ? 30 : 25, color: Colors.white),
            ],
          ),
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              //CurvedNavigationBarState navBarState = navigationKey.currentState;
              //navBarState.setPage(index);
            },
            children: <Widget>[
              DashBoard(),
             MusicList(),
              // AlbumListScreen(),
               //ArtistListScreen(),
               //PlayListScreen(),

            ],
          ),
        ));
  }
}

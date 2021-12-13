import 'package:flutter/material.dart';
import 'package:tiktok/View/HomePage.dart';
import 'package:tiktok/View/addVideo.dart';
import 'package:tiktok/View/profile.dart';

import 'package:tiktok/theme/colors.dart';
import 'package:tiktok/widgets/upload_icon.dart';

class Root extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<Root> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text(
            "Discover",
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        AddVideo(),
        Center(
          child: Text(
            "All Activity",
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        UserProfilePage()
      ],
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon": Icons.home, "label": "Home", "isIcon": true},
      {"icon": Icons.search, "label": "Discover", "isIcon": true},
      {"icon": Icons.add_box_outlined, "label": "", "isIcon": true},
      {"icon": Icons.notification_important, "label": "Inbox", "isIcon": true},
      {"icon": Icons.person, "label": "Me", "isIcon": true}
    ];
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          bottomItems[index]['icon'],
                          color: black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            bottomItems[index]['label'],
                            style: TextStyle(color: black, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: UploadIcon());
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

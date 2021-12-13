import 'package:flutter/material.dart';
import 'package:tiktok/widgets/profileTab1.dart';
import 'package:tiktok/widgets/profileTab2.dart';
import 'package:tiktok/widgets/profileTab3.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Nethan Cooper', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // profile photo
            Container(
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0x222222).withOpacity(1),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  )),
            ),

            // username
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '@createdbykoko',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),

            // number of following, followers, likes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Text(
                          '370',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '45K',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          '5.6M',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '  Likes  ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // buttons -> edit profile, insta links, bookmark
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text('Following',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.send,
                      color: Colors.blueAccent,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(15),
                //   child: Icon(
                //     Icons.bookmark_border,
                //     color: Colors.grey[800],
                //   ),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey.shade300),
                //       borderRadius: BorderRadius.circular(5)),
                // ),
              ],
            ),
            SizedBox(height: 15),

            // bio
            // Text(
            //   'bio here',
            //   style: TextStyle(color: Colors.grey[700]),
            // ),

            // default tab controller

            TabBar(
              tabs: [
                Tab(
                  icon: Text(
                    'Videos',
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                ),
                Tab(
                  icon: Text(
                    'Replies',
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                ),
                Tab(
                  icon: Text(
                    'Favourites',
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

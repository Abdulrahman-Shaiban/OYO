import 'package:flutter/material.dart';
import 'components/CustomSliverAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBar(
                content: TextField(
                  onChanged: (value) {},
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Try "OYO rooms in Munnar, Kerala"',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    focusColor: Colors.transparent,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.mic_none,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                    ),
                  ),
                ),
                icon: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.bookmark,
                        size: 90,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      Positioned(
                        child: Text(
                          'OYO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                leading: GestureDetector(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 23,
                  ),
                  onTap: () {},
                ),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 23,
                  ),
                  onTap: () {},
                ),
                context: context,
              ),
            ),
          ];
        },
        body: Center(
          child: Text(
            'OYO',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

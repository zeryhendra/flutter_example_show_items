import 'package:flutter/material.dart';


class uiHome extends StatefulWidget {
  @override
  _uiHomeState createState() => _uiHomeState();
}

class _uiHomeState extends State<uiHome> {

  TextEditingController codeSQL = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("Database Management v.1 (SQLite Version)"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {}, ),
            IconButton(icon: Icon(Icons.folder), onPressed: () {},)
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.list), text: "",),
            Tab(icon: Icon(Icons.code), text: "",)
          ],),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text("Tab 1"),),
            Center(child: Text("Tab 2"),)
          ],
        ),
      ),
    );
  }
}

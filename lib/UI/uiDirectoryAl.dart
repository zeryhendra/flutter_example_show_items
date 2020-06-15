
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ext_storage/ext_storage.dart';


class uiDirectoryAI extends StatefulWidget {
  @override
  _uiDirectoryAIState createState() => _uiDirectoryAIState();
}

class _uiDirectoryAIState extends State<uiDirectoryAI> {
  // Variable
  int _counter = 0;

  // Function
  void incrementCounter() {
    // https://stackoverflow.com/questions/58075432/how-to-get-files-from-external-storage-in-flutter
    // by chunhunghan

    new Directory('/storage/emulated/0/MyFile').create()
    // The created directory is returned as a Future.
        .then((Directory directory) {
      directory.path;
    });

    new File('/storage/emulated/0/MyFile/test.txt').create(recursive: true)
        .then((File file) {
          // Stuff to do after file has been created...
          print('${file.path}');
    });

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter ++;
    });
  }

  void example1() async {
    // https://stackoverflow.com/questions/50975636/list-of-files-in-flutter
    // by Serge Breusov
    var path = await ExtStorage.getExternalStorageDirectory();
    print(path); // /storage/emulated/0/

    var dir = Directory(path);
    print(dir.existsSync());

    var files = dir.listSync().toList();
    files.forEach((e) => print(e));
  }

  void example2() async {
    var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
    print(path); // /storage/emulated/0/Download

    var dir = Directory(path.toString());
    print(dir.existsSync());

    var files = dir.listSync().toList();
    files.forEach((e) => print(e));

  }


  // Widget
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Title 1"),),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(child: Text("Get ExternalStorageDirectory()"),
              onPressed: example1,),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(child: Text("Get Directory Downloads"),
                onPressed: example2,),
            ),
          ],
        ),
      )
    );
  }

}


import 'dart:io';
import 'dart:async';
import 'package:camera_vision/information/information.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File _image;
  final picker = ImagePicker();

  Future getImagefromcamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future getImagefromgallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //   centerTitle: true,
      //   title: Text('Camera Vision'),
      // ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/avatar/wood.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(

          padding: const EdgeInsets.only(top: 75.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  "Pick a Image",
                  style: TextStyle(fontSize: 18,backgroundColor: Colors.white,color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 5.0, left: 5.0, bottom: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Center(
                    child: _image == null
                        ? Text("No Image Selected",  style: TextStyle(fontSize: 16,color: Colors.black,backgroundColor: Colors.white))
                        : Image.file(_image),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    heroTag: null,
                    onPressed: getImagefromcamera,
                    tooltip: "camera",
                    child: Icon(Icons.camera_alt),
                  ),
                  SizedBox(width: 25.0),
                  FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    heroTag: null,
                    onPressed: getImagefromgallery,
                    tooltip: "gallery",
                    child: Icon(Icons.folder),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 75.0,right:20.0,left: 20.0),
                child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:Colors.lightBlueAccent,
                            padding: EdgeInsets.all(7.0),
                            minimumSize: Size.fromHeight(45),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Information(title: "Identity")));
                          },
                          child: Text('Submit', style: TextStyle(fontSize: 18),),
                        ),
                      ),

                    ]

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
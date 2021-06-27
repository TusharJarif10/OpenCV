
// import 'dart:io';
// import 'dart:async';
// import 'package:camera_vision/information/information.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class HomePage extends StatefulWidget {
//   final String title;
//
//   const HomePage({Key key, this.title}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   File _image;
//   final picker = ImagePicker();
//
//   Future getImagefromcamera() async {
//     final pickedImage = await picker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print("No Image Selected");
//       }
//     });
//   }
//
//   Future getImagefromgallery() async {
//     final pickedImage = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       } else {
//         print("No Image Selected");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       // appBar: AppBar(
//       //   backgroundColor: Colors.lightBlueAccent,
//       //   centerTitle: true,
//       //   title: Text('Camera Vision'),
//       // ),
//
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/avatar/wood.jpeg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//
//           padding: const EdgeInsets.only(top: 75.0),
//           child: ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               Center(
//                 child: Text(
//                   "Pick a Image",
//                   style: TextStyle(fontSize: 18,backgroundColor: Colors.white,color: Colors.black,fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0, right: 5.0, left: 5.0, bottom: 20.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200.0,
//                   child: Center(
//                     child: _image == null
//                         ? Text("No Image Selected",  style: TextStyle(fontSize: 16,color: Colors.black,backgroundColor: Colors.white))
//                         : Image.file(_image),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FloatingActionButton(
//                     backgroundColor: Colors.lightBlueAccent,
//                     heroTag: null,
//                     onPressed: getImagefromcamera,
//                     tooltip: "camera",
//                     child: Icon(Icons.camera_alt),
//                   ),
//                   SizedBox(width: 25.0),
//                   FloatingActionButton(
//                     backgroundColor: Colors.lightBlueAccent,
//                     heroTag: null,
//                     onPressed: getImagefromgallery,
//                     tooltip: "gallery",
//                     child: Icon(Icons.folder),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Padding(
//                 padding: const EdgeInsets.only(top: 75.0,right:20.0,left: 20.0),
//                 child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary:Colors.lightBlueAccent,
//                             padding: EdgeInsets.all(7.0),
//                             minimumSize: Size.fromHeight(45),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         Information(title: "Identity")));
//                           },
//                           child: Text('Submit', style: TextStyle(fontSize: 18),),
//                         ),
//                       ),
//
//                     ]
//
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

void main() {
  runApp(MyApp());
}

const String ssd = "SSD MobileNet";
const String yolo = "Tiny YOLOv2";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: TfliteHome(),
    );
  }
}

class TfliteHome extends StatefulWidget {
  @override
  _TfliteHomeState createState() => _TfliteHomeState();
}

class _TfliteHomeState extends State<TfliteHome> {
  String _model = ssd;
  File _image;

  double _imageWidth;
  double _imageHeight;
  bool _busy = false;

  List _recognitions;

  @override
  void initState() {
    super.initState();
    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  loadModel() async {
    Tflite.close();
    try {
      String res;
      if (_model == yolo) {
        res = await Tflite.loadModel(
          model: "assets/tflite/yolov2_tiny.tflite",
          labels: "assets/tflite/yolov2_tiny.txt",
        );
      } else {
        res = await Tflite.loadModel(
          model: "assets/tflite/ssd_mobilenet.tflite",
          labels: "assets/tflite/ssd_mobilenet.txt",
        );
      }
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }

  Future selectFromImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    predictImage(image);
  }

  predictImage(File image) async {
    if (image == null) return;

    if (_model == yolo) {
      await yolov2Tiny(image);
    } else {
      await ssdMobileNet(image);
    }

    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageWidth = info.image.width.toDouble();
        _imageHeight = info.image.height.toDouble();
      });
    })));

    setState(() {
      _image = image;
      _busy = false;
    });
  }

  yolov2Tiny(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path,
        model: "YOLO",
        threshold: 0.3,
        imageMean: 0.0,
        imageStd: 255.0,
        numResultsPerClass: 3);

    setState(() {
      _recognitions = recognitions;
    });
  }

  ssdMobileNet(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, numResultsPerClass: 1);

    setState(() {
      _recognitions = recognitions;
    });
  }

  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];
    if (_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight / _imageWidth * screen.width;

    Color blue = Colors.red;

    return _recognitions.map((re) {
      return Positioned(
        left: re["rect"]["x"] * factorX,
        top: re["rect"]["y"] * factorY,
        width: re["rect"]["w"] * factorX,
        height: re["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: blue,
                width: 3,
              )),
          child: Text(
            "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = blue,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width,
        child: _image == null ? Text("No Image Selected",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),) : Image.file(_image),
      ),
    );

    stackChildren.addAll(renderBoxes(size));

    if (_busy) {
      stackChildren.add(Center(
        child: CircularProgressIndicator(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Object Detection"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: "Pick Image from gallery",
        onPressed: selectFromImagePicker,
      ),
      body: Stack(
        children: stackChildren,
      ),
    );
  }
}

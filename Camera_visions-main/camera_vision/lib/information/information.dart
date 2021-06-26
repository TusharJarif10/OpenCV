import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  final String title;

  const Information({Key key, this.title}) : super(key: key);

  @override
  InformationState createState() => InformationState();
}

class InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true, title: Text(widget.title)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              color: Colors.lightBlue,
              height: 200,
              margin: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/avatar/viking.jpeg"),
                      ),
                    ),
                    Text(
                      "Ragnar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("The Vikings"),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.lightBlue,
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[400],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                      "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[300],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                      "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[200],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                      "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[100],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                      "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[50],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.lightBlue[50],
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Rangner",style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Text("Full Name", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Rangner",style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:camera_vision/home_page/home_page.dart';
import 'package:camera_vision/signup_page/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //var EmailValidator;

  bool isEmpty = false;

  get key => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title:
            Image.asset("assets/avatar/logo.png", height: 58.0, width: 120.0),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_rounded,
                size: 30.0,
                color: Colors.limeAccent,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.wifi_calling,
                size: 28.0,
                color: Colors.limeAccent,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_call,
                size: 30.0,
                color: Colors.limeAccent,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0,bottom: 0.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/avatar/hope.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 15.0, bottom: 145.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.limeAccent,
                      size: 80,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    autofocus: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email, color: Colors.limeAccent),
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(color: Colors.lime),
                      hintText: "Enter email",
                      hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your email';
                      }
                      // if(!EmailValidator.validate(value)) {
                      //   return 'Email not correct';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      autofocus: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.vpn_key_rounded,
                            color: Colors.limeAccent),
                        hintText: 'Password',
                        labelText: 'Enter password',
                        labelStyle: TextStyle(color: Colors.lime),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.white),
                      )),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.limeAccent),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignupPage(title: "Sign up")));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ]),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                            shape: StadiumBorder(),
                            minimumSize: Size.fromHeight(45),
                          ),
                          onPressed: () {
                            if (_passwordController.text == "123" &&
                                _emailController.text == "tushar") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TfliteHome()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: AlertDialog(
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("Go Back",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {},
                                      ),
                                      TextButton(
                                        child: Text("{ >",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {},
                                      )
                                    ],
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Password or Email is not correct',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lime,
                            shape: StadiumBorder(),
                            minimumSize: Size.fromHeight(45),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage(
                                          title: "Sign up",
                                        )));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

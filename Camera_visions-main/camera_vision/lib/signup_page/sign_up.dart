import 'package:camera_vision/API/api.dart';
import 'package:camera_vision/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final String title;

  const SignupPage({Key key, this.title}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool termsAndCondition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.limeAccent,

          centerTitle: true,
          title: Text(widget.title)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/avatar/hope.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(2.5),
        alignment: Alignment.center,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email, color: Colors.lightBlueAccent,),
                hintText: 'Email',
                labelText: 'Enter your Email',
                  hintStyle:  TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)

              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.account_circle, color: Colors.lightBlueAccent),
                hintText: 'Username',
                labelText: 'Enter your Username',
                  hintStyle:  TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.add_call,color: Colors.lightBlueAccent),
                hintText: 'Phone',
                labelText: 'Enter your Number',
                  hintStyle:  TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key_rounded, color: Colors.lightBlueAccent),
                hintText: 'Password',
                labelText: 'Enter Password',
                    hintStyle:  TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key_rounded,color: Colors.lightBlueAccent),
                hintText: 'Password',
                labelText: 'Re-enter Password',
                    hintStyle:  TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.watch_later,color: Colors.lightBlueAccent),
                hintText: 'Date of Birth',
                labelText: 'DD/MM/YY',
                  hintStyle:  TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                setState(() {
                  termsAndCondition = !termsAndCondition;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.5),
                    child: Checkbox(checkColor: Colors.black,
                      activeColor: Colors.lightGreenAccent,
                      value: termsAndCondition,
                      onChanged: (value) {
                        setState(() {
                          termsAndCondition = value;
                        });
                      },
                    ),
                  ),
                  Text('I agree the Terms and Conditions',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.limeAccent,
                      shape: StadiumBorder(),
                      minimumSize: Size.fromHeight(45),
                    ),
                    onPressed: termsAndCondition
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginPage(title: "Login")));
                          }
                        : null,
                    child: Text('SignUp',style: TextStyle(fontSize: 16),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white60,
                      shape: StadiumBorder(),
                      minimumSize: Size.fromHeight(45),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GoggleLoginApi(title: "welcome")));
                    },
                    child: Text('Login with Goggle',style: TextStyle(fontSize: 16),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

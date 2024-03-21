import 'package:flutter/material.dart';
import 'package:coba_mobile2/secondscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  String password = "";
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Silahkan login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: (isLogin) ? Colors.green : Colors.red,
                      ),
                    ),
                    icon: Icon(Icons.person),
                    hintText: 'Input Username',
                    labelText: 'Username',
                    iconColor: Colors.red,
                  ),
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: (isLogin) ? Colors.green : Colors.red,
                      ),
                    ),
                    icon: Icon(Icons.lock),
                    hintText: 'Input Password',
                    labelText: 'Password',
                    iconColor: Colors.red,
                  ),
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      String text = "";
                      SnackBar snackBar;
                      if (username == "admin" && password == "123") {
                        setState(() {
                          text = "Login Sukses";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          );
                          isLogin = true;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SecondScreen();
                          }));
                        });
                      } else {
                        setState(() {
                          text = "Login Gagal";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          );
                          isLogin = false;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    color: Colors.red,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

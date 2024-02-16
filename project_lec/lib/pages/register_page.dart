import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_lec/pages/login_page.dart';

void register() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  bool _passwordVisible1 = false;
  // bool _passwordVisible2 = false;
  void toggleVisibility1() {
    _passwordVisible1 = !_passwordVisible1;
  }
  //  void toggleVisibility2(){
  //   _passwordVisible2 = !_passwordVisible2;
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            height: 800,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'lib/images/3.png',
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // username
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     hintText: "Enter username",
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // email
                  TextField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // password
                  TextFormField(
                    controller: _passwordTextController,
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordVisible1,
                    decoration: InputDecoration(
                      hintText: "Create password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            toggleVisibility1();
                          });
                        },
                        icon: Icon(_passwordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // confirm password
                  // TextFormField(
                  //   controller: _passwordTextController,
                  //   keyboardType: TextInputType.text,
                  //   obscureText: !_passwordVisible2,
                  //   decoration: InputDecoration(
                  //     hintText: "Confirm password",
                  //     border: OutlineInputBorder(),
                  //     suffixIcon: IconButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           toggleVisibility2();
                  //         });
                  //       },
                  //       icon: Icon(
                  //         _passwordVisible2 ? Icons.visibility : Icons.visibility_off
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10,),
                  // no hp
                  // const TextField(
                  //   keyboardType: TextInputType.phone,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter your phone number",
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          'Already have account\?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // button
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: RawMaterialButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

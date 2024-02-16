import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_lec/pages/home_page.dart';
import 'package:project_lec/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}): super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static Future<User?> loginUsingEmailPassword(
    {required String email, 
    required String password, 
    required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (e){
        if(e.code == "user-not-found"){
          print("No user found for that email");
        }
      }
      return user;
    }

  @override
  bool _passwordVisible = false;

  void toggleVisibility(){
    _passwordVisible = !_passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
                  // Email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // password
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            toggleVisibility();
                          });
                        }, 
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Don\'t have an account\?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RegisterPage())),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue,
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
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                        print(user);
                        if(user != null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
                        }
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 50,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // other sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          "lib/images/google.png",
                          height: 72,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
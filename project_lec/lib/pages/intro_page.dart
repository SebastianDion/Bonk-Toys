import 'package:flutter/material.dart';
import 'package:project_lec/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 239, 236, 1),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/images/3.png',
                    height: 240,
                  ),
                ),
                const SizedBox(height: 48),

                //title
                const Text(
                  'Bonk Toys',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 10),

                //sub title
                const Text(
                  'Never Too Old For a Toy',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                //Start Now Button
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(
                          28.0), // Adjust the value as needed
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text(
                        'Login / Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

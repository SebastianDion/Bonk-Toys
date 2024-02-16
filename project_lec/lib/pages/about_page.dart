import 'package:flutter/material.dart';
import 'package:project_lec/pages/home_page.dart';
import 'package:project_lec/pages/shop_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 250,
                  height: 50,
                  child: const Text(
                    'Creator Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://stbm7resourcesprod.blob.core.windows.net/profilepicture/1c778920-f7fd-4e42-bed8-239a86b56cff.jpg"),
                  radius: 50,
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://stbm7resourcesprod.blob.core.windows.net/profilepicture/4c076620-6c9a-4613-bc9a-bae44e62c79c.jpg"),
                  radius: 50,
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://stbm7resourcesprod.blob.core.windows.net/profilepicture/94bd277a-4f48-44f2-adec-30440faed7a8.jpg"),
                  radius: 50,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 23),
                Column(
                  children: [
                    Text(
                      "Sebastian Dion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "2602111061",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "Randy Fernanda",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "2602083814",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "Robby Chandra",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "2602070023",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        "lib/images/3.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                    child: Text(
                      "Welcome to Bonk Toys Profile Page!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "Greetings, Bonkers! Bonk Toys is a Flutter app designed to make toy shopping easier for parents. Created by the passionate team of Robby Chandra, Abonk Fernanda, and Sebastian Dion, Bonk Toys offers a seamless and enjoyable experience for finding the perfect toys for your little ones.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Meet the Makers:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Robby Chandra: A skilled backend and frontend developer, Robby is the mastermind behind the application's technical backbone and user interface.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Abonk Fernanda: A talented frontend developer and UI/UX designer, Abonk brings an aesthetic touch to Bonk Toys, ensuring a visually appealing and intuitive experience.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Sebastian Dion: Combining his expertise in frontend development and UI/UX design, Sebastian contributes to the app's functionality and user-friendliness.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Bonk Toys boasts a variety of features to simplify your toy shopping journey:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Extensive Toy Catalog: Browse through a diverse collection of toys carefully curated to suit different ages and interests!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Effortless Search Filters: Narrow down your choices with convenient filters, making it a breeze to find the ideal toy.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Informed Decisions: Read reviews and ratings from other parents to get valuable insights before making a purchase.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Secure and Hassle-Free Payment: Enjoy a safe and straightforward checkout process through secure payment options.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Connect with Us:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Have questions or suggestions? We'd love to hear from you!\n\nEmail: [email protected]\nInstagram: @bonktoys\nFacebook: @bonktoys\nThank you for choosing Bonk Toys! Happy playtime!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Happy Bonking!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

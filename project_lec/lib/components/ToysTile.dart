// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../models/cart.dart';

class ToysTile extends StatelessWidget {
  Toy toy;
  void Function()? onTap;
  ToysTile({
    super.key,
    required this.toy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 270,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 32, 34, 33),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Toy pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              toy.imagePath, 
              height: 230, 
            ),
          ),
          //description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              toy.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Toy name
                    Text(
                      toy.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 5),

                    //Toy price
                    Text(
                      'Rp' + toy.price,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                //plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
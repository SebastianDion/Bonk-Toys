import 'package:flutter/material.dart';
import 'package:project_lec/pages/view_page.dart';
import 'package:provider/provider.dart';
import '../components/ToysTile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add toy to cart
  void addToyToCart(Toy toy) {
    Provider.of<Cart>(context, listen: false).addItemToCart(toy);
    // alert the user, toy successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succesfully Added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Color(0xffF8F8FB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 226, 218, 218)
                          .withOpacity(0.5)),
                  suffixIcon: Image.asset('lib/images/search.png')),
            ),
          ),
          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Don\'t miss out on our amazing deals! Shop now and save',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //hot picks
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewPage()),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // list of toys for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.getToyList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a toy from shop list
                Toy toy = value.getToyList()[index];

                // return the toy
                return ToysTile(
                  toy: toy,
                  onTap: () => addToyToCart(toy),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

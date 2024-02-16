import 'package:flutter/material.dart';
import 'package:project_lec/components/cart_item.dart';
import 'package:project_lec/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Heading dl boss

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(147, 252, 245, 208),
                borderRadius: BorderRadius.circular(12),
              ),
              width: 150,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: const Text(
                      "My Cart",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Icon(Icons.shopping_cart, size: 20),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                //Get Individual Toy
                Toy individualToy = value.getUserCart()[index];

                //return the cart item
                return CartItem(toy: individualToy);
              },
            ),
          )
        ]),
      ),
    );
  }
}

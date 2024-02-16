import 'package:flutter/material.dart';
import 'package:project_lec/models/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Toy toy;
  CartItem({super.key, required this.toy});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  //remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemsFromCart(widget.toy);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.toy.imagePath),
        title: Text(widget.toy.name),
        subtitle: Text('Rp' + widget.toy.price),
        trailing: IconButton(
          onPressed: removeItemFromCart, 
          icon:Icon(Icons.delete)
        ),
      ),
    );
  }
}
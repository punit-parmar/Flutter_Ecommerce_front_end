import 'package:flutter/material.dart';
import 'package:fluttershophome/components/cart_product.dart';
class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Cart'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
//            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){})

          ],
        ),
      body: CartProducts(),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text('Total',style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold),),
              subtitle: Text('\$35'),
            ),
             ),
          Expanded(
            child: MaterialButton(onPressed: (){},
            child: Text('Check Out',style: TextStyle(color: Colors.white),),
            color: Colors.lightGreen, ),
          )
        ],
      ),

    );
  }
}

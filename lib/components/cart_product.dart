import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cart_products_list = [
    {
      "name": "Blazzer",
      "picture": "images/blazer1.jpeg",
      "price": "20",
      "colour": "blue",
      "size": "M",
      "Quantity": "1"
    },
    {
      "name": "Dress",
      "picture": "images/dress1.jpeg",
      "price": "15",
      "colour": "Red",
      "size": "M",
      "Quantity": "1"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Single_product(
            pname: cart_products_list[index]["name"],
            ppictue: cart_products_list[index]["picture"],
            pprice: cart_products_list[index]["price"],
            pcolor: cart_products_list[index]["colour"],
            psize: cart_products_list[index]["size"],
            pqty: cart_products_list[index]["Quantity"],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final pname, ppictue, pprice, pcolor, psize, pqty;
  Single_product(
      {this.pname,
      this.ppictue,
      this.pprice,
      this.pcolor,
      this.pqty,
      this.psize});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          ppictue,
          width: 60.0,
          height: 100.0,
        ),
        title: Text(
          pname,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    psize,
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Colour:"),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    pcolor,
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Price:"),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "\$$pprice",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          children: <Widget>[
            Expanded(
                child: Padding(padding: EdgeInsets.all(1.0),
                    child: IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}))),
            Expanded(
              child: Padding(padding: EdgeInsets.all(4.0),
                child: Text(
                  pqty,
                  style: TextStyle(color: Colors.lightGreen,fontSize: 12.0),
                ),
              ),
            ),
            Expanded(
                child: IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}))
          ],
        ),
      ),
    );
  }
}

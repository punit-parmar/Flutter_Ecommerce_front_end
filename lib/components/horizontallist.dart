import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Horizontallist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          category(
            imagelocation: 'images/tshirt.png',
            imagecaption: 'Tshirt',
          ),
          category(
            imagelocation: 'images/jeans.png',
            imagecaption: 'Jeans',
          ),
          category(
            imagelocation: 'images/formal.png',
            imagecaption: 'Formals',
          ),
          category(
            imagelocation: 'images/informal.png',
            imagecaption: 'Informal',
          ),
          category(
            imagelocation: 'images/shoe.png',
            imagecaption: 'Shoes',
          ),
          category(
            imagelocation: 'images/dress.png',
            imagecaption: 'Dress',
          ),
          category(
            imagelocation: 'images/accessories.png',
            imagecaption: 'Accessories',
          ),
        ],
      ),
    );
  }
}
class category extends StatelessWidget {
  final String imagelocation ;
  final String imagecaption;
  category(
  {
    this.imagelocation,
    this.imagecaption
}
      );
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(0.5),
    child: InkWell(onTap: (){},
    child: Container(
      width: 110.0,
      child: ListTile(
        title: Image.asset(imagelocation,
        height: 40.0,
        width: 100.0,),
        subtitle: Text(imagecaption,textAlign: TextAlign.center,),
      ),
    ),
    ),);
  }
}

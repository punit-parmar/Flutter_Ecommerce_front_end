import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttershophome/components/horizontallist.dart';
import 'package:fluttershophome/components/products.dart';
import 'package:fluttershophome/pages/cart_details.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context)

  {
    Widget corousel_images= new Container(
      height: 250.00,

      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg')
         ],
        overlayShadow: true,
        overlayShadowSize: 2.0,
        autoplay: false ,
      // autoplayDuration: Duration(milliseconds: 0),
       // animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 0.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('ShopHome'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
          IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
          })

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(

                accountName: Text('Punit Parmar'),
                accountEmail: Text('parmar.punit98@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.lightGreen,

            ),),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
              },
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home,color: Colors.lightGreen,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.person,color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Cart()));
              },
              child: ListTile(
                title: Text('Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.lightGreen,),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          corousel_images,
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text('Categories'),),
          Horizontallist(),
          Padding(padding: const EdgeInsets.all(4.0),
          child: Text('Recent Products')),
          Container(
            height: 350.0,
            child: products(),
          )
        ],
      ),
    );
  }
}

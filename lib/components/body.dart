import 'package:flutter/material.dart';
class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30,0),
            child: Text('Welcome to ShopHome',
              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          Image.asset('images/logo.png'),
           ClipRRect(
             borderRadius: BorderRadius.circular(30),
             child: FlatButton(
               padding: EdgeInsets.symmetric(vertical: 15,horizontal: 75),
               color: Colors.green,
                 onPressed: (){}, child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),)
             ),
           ),
          Padding(padding: const EdgeInsets.only(top: 15)),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 70),
                color: Colors.green,
                onPressed: (){}, child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 20),)
            ),
          ),
        ],
      ),
    );
  }
}

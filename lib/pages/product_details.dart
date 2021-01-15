import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershophome/components/products.dart';
import 'package:fluttershophome/pages/home.dart';
class ProductDetails extends StatefulWidget {
  final pdname;
  final pdpicture;
  final pdoprice;
  final pdprice;
  ProductDetails({
    this.pdname,
    this.pdpicture,
    this.pdoprice,
    this.pdprice
});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: InkWell(
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));} ,
            child: Text('ShopHome')),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),

        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 270.0,
        child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(widget.pdname,style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text("\$"+widget.pdprice, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                subtitle: Text("\$"+widget.pdoprice,style: TextStyle(fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
              ),
            ),
            child: Image.asset(widget.pdpicture,)),),
          
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('Size',style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                    content: Text('Choose Size'),
                    actions: <Widget>[
                      MaterialButton(onPressed: (){}
                      ,child: Text('Close',style: TextStyle(color: Colors.blue),),)
                    ],
                  );
                });
              },
              color: Colors.white,
              textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size',style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(child: Icon(Icons.arrow_drop_down),)
                    ],
                  )
                ,)),
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Colour',style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        content: Text('Choose Colour'),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){}
                            ,child: Text('Close',style: TextStyle(color: Colors.blue),),)
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Colour',style: TextStyle(fontWeight: FontWeight.bold),)),
                    Expanded(child: Icon(Icons.arrow_drop_down),)
                  ],
                )
                ,)),
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        content: Text('Choose Quantity'),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){}
                            ,child: Text('Close',style: TextStyle(color: Colors.blue),),)
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Qty.',style: TextStyle(fontWeight: FontWeight.bold),)),
                    Expanded(child: Icon(Icons.arrow_drop_down),)
                  ],
                )
                ,))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
              color: Colors.lightGreen,
              textColor: Colors.black,
              child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold),),)),
              IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.lightGreen,), onPressed: (){}),
              IconButton(icon: Icon(Icons.favorite_border,color: Colors.lightGreen,), onPressed: (){},)
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Pack it up! We're deploying to Endor in the morning, and you need to find a bag big enough for the essentials with extra space for a small teddy-bear like lifeform. Hypothetically. We're not telling you to take an Ewok back with you, but… if you find your Ewok BFF, you'll have the option.This Star Wars Rebel Alliance Special Forces Rucksack is big enough to fit everything you need for your day, and then some (including an Ewok). The camo accents will make it harder for the Stormtroopers to spot you on Endor which is a huge plus, especially considering their rucksacks are (you guessed it) white. Sometimes standing out is the worst thing you can do.  "),
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text('Product Name:',style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),
              child: Text(widget.pdname),),]),
              Row(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                    child: Text('Product Brand:',style: TextStyle(color: Colors.grey),),),
                  Padding(padding: const EdgeInsets.all(5.0),
                    child: Text('Barand X'),)]),
    Row(
    children: <Widget>[
    Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
    child: Text('Product Condition:',style: TextStyle(color: Colors.grey),),),
    Padding(padding: const EdgeInsets.all(5.0),
    child: Text('NEW'),),
            ],
          ),
          Divider(),
          Padding(padding: const EdgeInsets.all(5.0),
          child: Text('Similar Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),),
          Divider(),
          Container(
            height: 300.0,
            child: products(),
          )
        ],
      
      )
    );


  }
}

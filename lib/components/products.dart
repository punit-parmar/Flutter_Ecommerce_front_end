import 'package:flutter/material.dart';
import 'package:fluttershophome/pages/product_details.dart';
class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  var prod_list=[
    {
      "name":"Blazzer",
      "picture":"images/blazer1.jpeg",
      "oldprice":"50",
      "price":"20"
    },
    {
      "name":"Dress",
      "picture":"images/dress1.jpeg",
      "oldprice":"40",
      "price":"15"
    },
    {
      "name":"Pants",
      "picture":"images/pants2.jpeg",
      "oldprice":"10",
      "price":"5"
    },
    {
      "name":"Heels",
      "picture":"images/hills1.jpeg",
      "oldprice":"100",
      "price":"50"
    },
    {
      "name":"Joggers",
      "picture":"images/pants1.jpg",
      "oldprice":"80",
      "price":"40"
    },
    {
      "name":"Skirt",
      "picture":"images/skt1.jpeg",
      "oldprice":"70",
      "price":"35"
    },
    {
      "name":"Dress",
      "picture":"images/dress2.jpeg",
      "oldprice":"50",
      "price":"20"
    },
    {
      "name":"Blazzer",
      "picture":"images/blazer2.jpeg",
      "oldprice":"50",
      "price":"20"
    },
  ];
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prod_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: ( BuildContext context,int index){
          return product(
            pname: prod_list[index]["name"],
            ppicture: prod_list[index]["picture"],
            poprice: prod_list[index]["oldprice"],
            pprice: prod_list[index]["price"],
          );
        }
    );
  }
}
class product extends StatelessWidget {
  final String pname;
  final String ppicture;
  final String poprice;
  final String pprice;
  product({
    this.pname,
    this.ppicture,
    this.poprice,
    this.pprice
});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(
            pdname: pname,
            pdpicture: ppicture,
            pdprice: pprice,
            pdoprice: poprice,
          )));
        },
        child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(pname,style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text("\$$pprice", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                subtitle: Text("\$$poprice",style: TextStyle(fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
              ),
            ),
            child: Image.asset(ppicture)),),

    );
  }
}

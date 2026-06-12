import 'package:cloths_chance2/model/productmodel.dart';
import 'package:cloths_chance2/viewmodel/Cartprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productpage extends StatefulWidget {
  final Productmodel product;
  const Productpage({super.key , required this.product});

  @override
  State<Productpage> createState() => _ProductpageState();
}
int quan = 1;
class _ProductpageState extends State<Productpage> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Cartprovider>(context);
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: Text(widget.product.name , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Icon(CupertinoIcons.heart_fill , size: 30,)
        ],

      ),
      body: Padding(padding: EdgeInsetsGeometry.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

            ),
            child: Image.asset(widget.product.image , fit: BoxFit.fill, 
            ),
          ),
          SizedBox(height: 5,),
          Text(widget.product.name , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text(widget.product.description , style: TextStyle(fontSize: 15 , color: Colors.black.withOpacity(0.7)),),
          SizedBox(height: 8,),
          Text("\$${widget.product.price}" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text("Size" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )
                ),
                child: Center(
                  child: Text("S" , style: TextStyle(fontSize: 15 , ),),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue.withOpacity(0.3),
                  border: Border.all(
                    color: Colors.blue,
                  )
                ),
                child: Center(
                  child: Text("M" , style: TextStyle(fontSize: 15 , ),),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )
                ),
                child: Center(
                  child: Text("L" , style: TextStyle(fontSize: 15 , ),),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )
                ),
                child: Center(
                  child: Text("XL" , style: TextStyle(fontSize: 15 , ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text("Quantity" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 15,
              children: [
                SizedBox(width: 3,),
                IconButton(onPressed: (){
                  setState(() {
                    if (quan >1){
                      quan--;
                    }
                  });
                }, icon: Icon(CupertinoIcons.minus , size: 20, color: Colors.black,)),
                Text("$quan" , style: TextStyle(fontSize: 15),),
                IconButton(onPressed: (){
                  setState(() {
                    quan++;
                  });
                }, icon: Icon(Icons.add , color: Colors.blue, size: 20,))
              ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () => p.AddtoCart(widget.product, quan),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.cart , size: 35, color: Colors.white,),
                  Text("Add to cart" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.white),)
                ],
              ),
            ),
          )

        ],
      ),
      ),
    );
  }
}
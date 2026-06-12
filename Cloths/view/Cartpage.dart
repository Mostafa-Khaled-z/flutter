import 'package:cloths_chance2/viewmodel/Cartprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Cartprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>p.ClearCart(), icon: Icon(CupertinoIcons.trash_fill , size: 30,)),
        ],
      ),
      body: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10 , horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ListView.builder(
            itemCount: p.cart.length,
            
            itemBuilder: (context , index){
            var entry = p.cart.entries.elementAt(index);
            var item = entry.value;
            return Card(
              margin: EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
              child: Padding(padding: EdgeInsetsGeometry.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(item.product.image , width: 80, height: 80, fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.product.name , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                      Text("Color : ${item.product.color} , size : \n ${item.product.size}",
                      style: TextStyle(fontSize: 15 , color: Colors.grey) ,
                      ),
                      Text("\$${item.product.price}" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),

                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      )
                    ),
                    child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 5 , vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        IconButton(onPressed: ()=>p.decreaseQuantity(item.product.id), 
                        icon: Icon(CupertinoIcons.minus , size: 15,)),
                        Text("${item.qunatity}" , style: TextStyle(fontSize: 20),),
                        IconButton(onPressed: ()=>p.IncreaseQuantity(item.product.id), 
                        icon: Icon(Icons.add , size: 15 , color: Colors.blue,))
                      ],
                    ),
                    ),
                  )
                ],
              ),
              ),
            );
          }))
        ],
      ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("subtotal", style: TextStyle(fontSize: 15 , color: Colors.grey),),
                  Text("\$${p.subtotal()}" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  
                ],
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping", style: TextStyle(fontSize: 15 , color: Colors.grey),),
                  Text("calculated next step" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                ],
              ),
              Spacer(),
              ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                backgroundColor: Colors.blue,
                
              ), 
              child: Center(
                child: Text("Proceed to checkout" , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
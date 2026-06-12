import 'package:cloths_chance2/model/productmodel.dart';
import 'package:cloths_chance2/view/Cartpage.dart';
import 'package:cloths_chance2/view/Productpage.dart';
import 'package:cloths_chance2/viewmodel/Cartprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    final List <Productmodel> items=[
      Productmodel(id: "p1", name: "Zara shirt", description: "high quality high product", color: "white", price: 49.0, size: "M", image: "Assets/1.jpg"),
      Productmodel(id: "p2", name: "jeans jacket", description: "high quality high product", color: "blue", price: 60, size: "S" , image: "Assets/2.jpg"),
      Productmodel(id: "p3", name: "Cotton crewneck tee", description: "high quality high product", color: "Off white", price: 29.0, size: "L" , image: "Assets/3.jpg"),
      Productmodel(id: "p4", name: "jeans short", description: "high quality high product", color: "blue", price: 69.0, size: "32", image: "Assets/4.jpg"),
      Productmodel(id: "p5", name: "Classic coat", description: "high quality high product", color: "bage", price: 119.0, size: "L", image: "Assets/5.jpg"),
      Productmodel(id: "p6", name: "chunky sweeter", description: "high quality high product", color: "green", price: 75.0, size: "M", image: "Assets/6.jpg")
      
    ];
    final p = Provider.of<Cartprovider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("New Arrivals" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.search  , size: 30,)),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
              }, icon: Icon(CupertinoIcons.cart , size: 30,)),
              Positioned(
                left: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(child: Text("${p.count}" , style: TextStyle(color: Colors.black , fontSize: 10),)),
                ))
            ],
          )
        ],
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 215, 215, 215)
            ),
            child: Row(
              children: [
                SizedBox(width: 5,),
                Text("Filter" , style: TextStyle(fontSize: 15),),
                SizedBox(width: 5,),
                Icon(Icons.filter , size: 25,),
              ],
            ),
          ),
          SizedBox(width: 15,),
          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 215, 215, 215)
            ),
            child: Row(
              children: [
                SizedBox(width: 5,),
                Text("sort by" , style: TextStyle(fontSize: 15),),
                SizedBox(width: 5,),
                Icon(Icons.arrow_downward , size: 25,),
              ],
            ),
          ),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7
              
              
              ),
              itemCount: items.length, 
              itemBuilder: (context , index ){
                var _item = items[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Productpage(product: _item)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image.asset(_item.image , fit: BoxFit.fill,
                              height: double.infinity,
                              width: double.infinity,
                              ),
                              
                            ),
                            Positioned(
                              right: 0,
                              bottom: 4,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: Center(child: IconButton(onPressed: ()=>p.AddtoCart(_item, 1), icon: Icon(Icons.add , size: 25,))),
                              ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("${_item.name}" ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                      Text("\$${_item.price}" , style: TextStyle(fontSize: 15 , color: const Color.fromARGB(255, 122, 120, 120)),)
                    ],
                  ),
                );
              
              }),
          )
          
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.grey,), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category ,color: Colors.blueAccent,), label: "Category"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill, color: Colors.grey,), label: "wishlist"),
        BottomNavigationBarItem(icon: Icon(Icons.person , color: Colors.grey, ), label: "profile" )
      ]),
    );

  }
}
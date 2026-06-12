import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools/model_view/app_data.dart';
import 'package:tools/model_view/cart_provider.dart';
import 'package:tools/view/cart_screen.dart';
import 'package:tools/view/details_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 24,
        ),
        title: Text("Available Tools"),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'ARCHITECTURAL GRADE EQUIPMENT',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Precision gear for your next masterpiece',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        CupertinoIcons.hammer_fill,
                        color: Colors.white,
                        size: 70,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: appData.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(tool: appData[index])));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        index == 0
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Featured',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[700]),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${appData[index].price}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '/day',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : SizedBox(),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appData[index].bg),
                          child: Icon(
                            appData[index].icon,
                            size: 70,
                            color: index == 0 ? Colors.blue : Colors.black54,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              appData[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            index != 0
                                ? Row(
                                    children: [
                                      Text(
                                        '\$${appData[index].price}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '/day',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                          ],
                        ),
                        Text(
                          appData[index].desc,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            prov.addToCart(appData[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.add), Text('Add')],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Need A Custom Kit?',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Contact Our Project Manager To Know More About Our New Offers',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Get A Qoute',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            }
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.wrench_fill), label: "Tools"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.paperplane_fill), label: "Order"),
          ]),
    );
  }
}

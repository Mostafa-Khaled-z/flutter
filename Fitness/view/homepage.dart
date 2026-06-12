import 'package:fitness/model_view/app_data.dart';
import 'package:fitness/model_view/cart_provider.dart';
import 'package:fitness/view/cart_screen.dart';
import 'package:fitness/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contxt) => CartScreen()));
              },
              icon: Icon(Icons.calendar_month)),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "Find Your Class",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search For A Class",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == 0 ? Colors.blue : Colors.grey[400]),
                  child: Text(
                    category[index],
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 0 ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: date.length,
                      itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == 1
                                  ? Colors.blue
                                  : Colors.transparent),
                          child: Column(
                            spacing: 10,
                            children: [
                              Text(
                                days[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.grey[600]),
                              ),
                              Text(
                                date[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contxt) => DetailsScreen(
                                    gymClass: appData[index],
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            offset: Offset(0, 0),
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.outer)
                      ], borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.asset(
                              appData[index].img,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      appData[index].level,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14),
                                    ),
                                    Text(
                                      appData[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'With ${appData[index].coach}',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14),
                                    ),
                                    Text(
                                      appData[index].time,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    prov.addToCart(appData[index]);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: !appData[index].isBooked
                                            ? Colors.blue
                                            : Colors.grey),
                                    child: Text(
                                      !appData[index].isBooked
                                          ? "Add To Cart"
                                          : "Booked",
                                      style: TextStyle(
                                          color: !appData[index].isBooked
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
    );
  }
}

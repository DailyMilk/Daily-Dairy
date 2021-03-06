import 'package:flutter/material.dart';
import 'package:temp_daily_app/Screens/productDetails.dart';

class paneerProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return proState();
  }
}

class proState extends State<paneerProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 200.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 1.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                card('Amul Paneer (500gm)', '80', 'images/Paneer/amul.jpg', false, true,'Low Fat\nHigh protein',
                    context),
                card('Ananda Paneer (500gm)', '100', 'images/Paneer/ananda.jpg', false,
                    false, 'Low Fat\nHigh protein',context),
                card('Govardhan Paneer (500gm)', '200', 'images/Paneer/govardhan.png', false,
                    false, 'Low Fat\nHigh protein',context),
                card('Mother Dairy (500gm)', '80', 'images/Paneer/motherdairy.jpg', false,
                    false, 'Low Fat\nHigh protein',context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget card(
      String name, String price, String img, bool add, bool fav,String desc, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
              assetPath:img,
              price: price,
              name: name,
              desc:desc
          )));
        },
        child: Container(
          decoration: BoxDecoration(
              //border: Border.all(width: 2.0,color: Color.fromRGBO(22, 102, 225, 1)),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0.0,
                    blurRadius: 8.0)
              ],
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.check_box,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Hero(
                tag: img,
                child: Container(
                  height: 110.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.contain)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(22, 102, 225, 1),
                  height: 1.0,
                ),
              ),
              Text(
                name,
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              ),
              Text(
                '₹ $price /-',
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

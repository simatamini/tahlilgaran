import 'package:flutter/material.dart';
import 'package:tahlilgaran/Product/classProduct.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  List<Product> listProduct = [
    Product(
        image: "https://m.media-amazon.com/images/I/511G6nsfhLL._AC_UX522_.jpg",
        price: "220",
        color: Colors.black),
    Product(
        image: "https://m.media-amazon.com/images/I/511G6nsfhLL._AC_UX522_.jpg",
        price: "220",
        color: Colors.yellow),
    Product(
        image: "https://m.media-amazon.com/images/I/511G6nsfhLL._AC_UX522_.jpg",
        price: "220",
        color: Colors.yellow),

  ];

  List listName = ["New", "Oversize", "Crop"];


  int i = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String dropdownValue = 'colors';
  String dropdownValue1 = 'lenght';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
          child: Container(
              color: Colors.black38,

              child: Column(

                children: [ExpansionTile(
                    title: new Text('Size'),
                    backgroundColor: Colors.black54,
                    children: <Widget>[
                      Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: <Widget>[
                          Chip(


                            label: const Text('S'),
                          ),
                          Chip(

                            label: const Text('M'),
                          ),
                          Chip(

                            label: const Text('L'),
                          ),
                          Chip(

                            label: const Text('XL'),
                          ),
                        ],
                      )


                    ]),
                  ExpansionTile(
                      title: new Text('Types'),
                      backgroundColor: Colors.black54,
                      children: <Widget>[
                        Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: <Widget>[
                            Chip(

                              label: const Text('Maxi'),
                            ),
                            Chip(

                              label: const Text('Short'),
                            ),
                            Chip(

                              label: const Text('Tee'),
                            ),

                          ],
                        )


                      ])
                ],
              ))


      ),


      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Women Sweatshirts",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [

          Icon(Icons.category, color: Colors.white),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search, color: Colors.white),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.shop, color: Colors.white),
          SizedBox(
            width: 10,
          ),

        ],
      ),
      body: Column(
        children: [
      Container(
color: Colors.black87,

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_rounded),
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
            ),
            onChanged: (String? Value) {
              setState(() {
                dropdownValue = Value!;
              });
            },
            items: <String>['colors', 'red', 'blue', 'green', 'yellow']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('colors'),
          ),
          DropdownButton<String>(
            value: dropdownValue1,
            icon: const Icon(Icons.arrow_drop_down_rounded),
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
            ),
            onChanged: (String? Value) {
              setState(() {
                dropdownValue1 = Value!;
              });
            },
            items: <String>[
              'lenght',
              'maxi',
              'short',
              'long',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('colors'),
          ),
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: Icon(Icons.filter_alt_outlined,color: Colors.grey),

          )
        ],
      ),
    ),
    Container(
      color: Colors.black87,
    height: 40,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: listName.length,
    itemBuilder: (context, index) {
    return GestureDetector(
    onTap: () {
    setState(() {
    i = index;
    });
    },
    child: Column(
    children: [
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Text(
    listName[index],
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: i == index ? Colors.white : Colors.grey),
    ),
    ),
    SizedBox(
    height: 10,
    ),
    i == index
    ? Container(
    height: 2,
    width: 50,
    color: Colors.white,
    )
        : Container(),
    ],
    ),
    );
    },
    ),
    ),
    Expanded(
    child: Container(

        color: Colors.black87,

        child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
        ),
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF1F1F1)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          listProduct[index].image,
                          height: 100,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),Text("\$"+listProduct[index].price),
                        // Text(listProduct[index].color)
                      ],
                    )),
              ));
        }))
    ,),
    ],
    ),
    );
  }
}

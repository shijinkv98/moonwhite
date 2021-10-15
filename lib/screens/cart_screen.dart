import 'package:flutter/material.dart';
import 'package:moonwhite/helpers/constants.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => new _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double spinner_product = 0;
  List cartList = [];

  Widget getItemsList() {
    List<String> imageURLlist = [
      'assets/images/fresh_apple.jpg',
      'assets/images/mangos.jpg',
      'assets/images/grapes.jpg'
    ];
    List<String> title = ['Apple', 'Mango', 'Grapes'];
    List<String> quantity = ['100/kg', '150/kg', '100/kg'];

    Widget getItems() {
      return GridView.builder(
          itemCount: imageURLlist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 180,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 9),
          semanticChildCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholder: imageURLlist[index],
                        image: imageURLlist[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              title[index],
                              style: mainTitle,
                            ),
                            Text(
                              quantity[index],
                              style: mainTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    cartList.length == 0
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                cartList.add(index);
                              });
                            },
                            child: Container(
                              height: 40,
                              color: primaryColor,
                              child: Center(
                                  child: Text(
                                'ADD TO CART',
                                style: mainTitleWhite,
                              )),
                            ),
                          )
                        : Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: primaryColor),
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    cartList.removeLast();
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: primaryColor,
                                    width: 20,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, right: 10),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text('${cartList.length.toString()}${' in cart'}'),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartList.add(index);
                                    });
                                  },
                                  child: Container(
                                    color: primaryColor,
                                    width: 20,
                                    height: 40,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                  ],
                ),
              ),
            );
          });
    }

    return Padding(padding: const EdgeInsets.all(20), child: getItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            padding: EdgeInsets.only(top: 35),
            onPressed: () {},
            icon: Image.asset(
              'assets/images/cart.png',
              height: 45,
              width: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, right: 35),
            child: Container(
              width: 25,
              height: 35,
              decoration: rounded,
              child: Center(
                  child: Text(
                cartList.length.toString(),
                style: mainTitleblack,
              )),
            ),
          )
        ],
      ),
      body: getItemsList(),
      backgroundColor: Colors.white,
    );
  }
}

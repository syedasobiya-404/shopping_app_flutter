import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;
  final List<int> sizes;
  const DetailsScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.sizes});

  @override
  State<StatefulWidget> createState() {
    return _DetailsScreenState();
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              height: 220,
              widget.image,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 28,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(
                245,
                247,
                249,
                1,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  10,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  style: Theme.of(context).textTheme.titleLarge,
                  "\$ ${widget.price}",
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sizes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          selectedSize = index;
                          setState(() {});
                        },
                        child: Chip(
                          backgroundColor: selectedSize == index
                              ? Theme.of(context).primaryColor
                              : null,
                          padding: EdgeInsets.all(12),
                          label: Text(
                            widget.sizes[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(
                      254,
                      206,
                      1,
                      1,
                    ),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    minimumSize: Size(
                      double.infinity,
                      50,
                    ),
                  ),
                  onPressed: () {
                    if (selectedSize != -1) {
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart({
                        "title": widget.title,
                        "price": widget.price,
                        "imageUrl": widget.image,
                        "size": widget.sizes[selectedSize]
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Item successfully added to cart",
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select a size"),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Add to cart",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

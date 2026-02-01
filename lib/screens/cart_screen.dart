import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> cartItems = Provider.of<CartProvider>(context).cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final Map item = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(item["imageUrl"]),
                  ),
                  title: Text(
                    item["title"],
                  ),
                  subtitle: Text(
                    item["size"].toString(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => Text("Hello"),
                      // );

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Are you sure?"),
                          content: Text(
                            "This action will remove the product from the cart.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeFromCart(item);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Item successfully removed from cart",
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                "No",
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30.0,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No item in cart",
              ),
            ),
    );
  }
}

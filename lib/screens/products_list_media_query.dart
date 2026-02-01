import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/data/global_variables.dart';
import 'package:shopping_app/screens/details_screen.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
// ====================== Media Query =======================

  int selectedBrand = 0;
  @override
  Widget build(BuildContext context) {
    // inherited widget
    // final deviceSize = MediaQuery.of(context).size;
    // inherited model
    final deviceSize = MediaQuery.sizeOf(context);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(
          20,
        ),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(
          255,
          255,
          255,
          1,
        ),
      ),
    );

    final List<String> brands = [
      "All",
      "Nike",
      "Puma",
      "Addidas",
      "Skechers",
      "Calvin Klein",
      "Bata"
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            // Main Header Start
            Row(
              children: [
                Text(
                  "Shopping\nApp",
                  //inherited widget
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIconColor: Color.fromRGBO(
                        119,
                        119,
                        119,
                        1,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            // Main Header End
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   selectedBrand = index;
                      // });
                      selectedBrand = index;
                      setState(() {});
                    },
                    child: Chip(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      label: Text(brands[index]),
                      backgroundColor: selectedBrand == index
                          ? Theme.of(context).primaryColor
                          : Color.fromRGBO(245, 247, 249, 1),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: deviceSize.width >= 1100
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.5),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final Map product = products[index];
                        // return InkWell(
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DetailsScreen(
                                  image: product["imageUrl"],
                                  price: product["price"],
                                  title: product["title"],
                                  sizes: product["sizes"],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            image: product["imageUrl"],
                            price: product["price"],
                            title: product["title"],
                            color: index.isEven
                                ? Color.fromRGBO(
                                    216,
                                    240,
                                    253,
                                    1,
                                  )
                                : Color.fromRGBO(
                                    245,
                                    247,
                                    249,
                                    1,
                                  ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final Map product = products[index];
                        // return InkWell(
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DetailsScreen(
                                  image: product["imageUrl"],
                                  price: product["price"],
                                  title: product["title"],
                                  sizes: product["sizes"],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            image: product["imageUrl"],
                            price: product["price"],
                            title: product["title"],
                            color: index.isEven
                                ? Color.fromRGBO(
                                    216,
                                    240,
                                    253,
                                    1,
                                  )
                                : Color.fromRGBO(
                                    245,
                                    247,
                                    249,
                                    1,
                                  ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

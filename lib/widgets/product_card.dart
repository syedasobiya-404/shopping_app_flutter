import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Color color;
  final String title;
  final double price;
  final String image;
  const ProductCard(
      {super.key,
      required this.color,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "\$ $price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image.asset(
              image,
              height: 240,
            ),
          ),
        ],
      ),
    );
  }
}

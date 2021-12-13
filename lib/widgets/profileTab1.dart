import 'package:flutter/material.dart';
import 'package:tiktok/Model/data_model.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemsImages.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Container(
              child: Image(
            fit: BoxFit.cover,
            image: AssetImage(itemsImages[index]['image']),
          ));
        });
  }
}

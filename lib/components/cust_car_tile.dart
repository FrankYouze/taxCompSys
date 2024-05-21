import 'package:flutter/material.dart';

class CustCarTile extends StatelessWidget {
  final String imageUrl;
  final String carModel;
  const CustCarTile({super.key, required this.imageUrl, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Card(


      child: ListTile(
        leading: Icon(Icons.car_rental),
        title:  Image(
            height: 200,
            width: 200,
            image: NetworkImage(imageUrl)),
        subtitle: Text(carModel),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
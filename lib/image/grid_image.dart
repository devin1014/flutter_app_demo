import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FixedSizeGridImagePage extends StatelessWidget {
  FixedSizeGridImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GridView Demo')),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.0),
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
            Icon(Icons.event),
            Icon(Icons.print),
            Icon(Icons.access_alarm),
            // asset network
            // Container(
            //   child: FadeInImage.assetNetwork(
            //       placeholder: 'assets/images/nba_placeholder_small.png',
            //       image: 'https://picsum.photos/250?image=1'),
            // ),
            // //cache network
            // Container(
            //   child: CachedNetworkImage(
            //     imageUrl: 'https://picsum.photos/250?image=1',
            //     placeholder: (context, url) => SizedBox(
            //         width: 48, height: 48, child: CircularProgressIndicator()),
            //     errorWidget: (context, url, error) => Icon(Icons.error),
            //   ),
            // ),
          ],
        ));
  }
}

class NetworkGridImagePage extends StatelessWidget {
  NetworkGridImagePage({Key? key}) : super(key: key);

  static const images = [
    'https://picsum.photos/250?image=1',
    'https://picsum.photos/250?image=2',
    'https://picsum.photos/250?image=3',
    'https://picsum.photos/250?image=4',
    'https://picsum.photos/250?image=5',
    'https://picsum.photos/250?image=6',
    'https://picsum.photos/250?image=7',
    'https://picsum.photos/250?image=8',
    'https://picsum.photos/250?image=9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GridView")),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.0),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.network(images[index]);
              // return FadeInImage.assetNetwork(
              //     placeholder: 'assets/images/nba_placeholder_small.png',
              //     image: images[index]);
            }));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlanetContainerShotcut extends StatelessWidget {
  const PlanetContainerShotcut(
      {super.key, required this.imageURL, required this.name});

  final String imageURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      padding: const EdgeInsets.all(10.0),
      width: screenWidth * 0.44,
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 0.5,),
            CachedNetworkImage(
              imageUrl: imageURL,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: screenWidth / 3.5,
              fit: BoxFit.cover,
            ),
            Text(name),
            const SizedBox(height: 0.5,),
          ],
        ),
      ),
    );
  }
}



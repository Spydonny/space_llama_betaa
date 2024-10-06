import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'labelled_text.dart';

class PlanetContainerFull extends StatelessWidget {
  const PlanetContainerFull(
      {super.key, required this.name, required this.size, required this.dist, required this.habit, required this.gravity,
        required this.compose, required this.features, required this.imageURL});

  final String name;
  final String size;
  final String dist;
  final String habit;
  final String gravity;
  final String compose;
  final String features;
  final String imageURL;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        padding: const EdgeInsets.all(10.0),
        width: screenWidth * 0.6,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 0.5),
              CachedNetworkImage(
                imageUrl: imageURL,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.circle_outlined),
                width: screenWidth / 2.5,
                fit: BoxFit.cover,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name),
                    labeledText('Size', size),
                    labeledText('Distance', dist),
                    labeledText('Habitat', habit),
                    labeledText('Gravity', gravity),
                    labeledText('Composition', compose),
                    labeledText('Features', features),
                  ],
                ),
              ),
              const SizedBox(height: 0.5)
            ],
          ),
        )
    );
  }
}

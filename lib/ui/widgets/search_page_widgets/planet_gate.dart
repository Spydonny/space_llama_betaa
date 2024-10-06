import 'package:astro_llama/ui/widgets/search_page_widgets/planet_container_full.dart';
import 'package:astro_llama/ui/widgets/search_page_widgets/planet_container_shotcut.dart';
import 'package:flutter/material.dart';

class PlanetGate extends StatefulWidget {
  const PlanetGate(
      {super.key, required this.imageURL, required this.name, required this.size, required this.dist, required this.habit, required this.gravity, required this.compose, required this.features});

  final String imageURL;
  final String name;
  final String size;
  final String dist;
  final String habit;
  final String gravity;
  final String compose;
  final String features;

  @override
  State<PlanetGate> createState() => _PlanetGateState();
}

class _PlanetGateState extends State<PlanetGate> {
  bool isShort = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShort = !isShort;
        });
      },
      child: isShort
          ? PlanetContainerShotcut(imageURL: widget.imageURL, name: widget.name)
          : PlanetContainerFull(
        imageURL: widget.imageURL,
        name: widget.name,
        size: widget.size,
        dist: widget.dist,
        habit: widget.habit,
        gravity: widget.gravity,
        compose: widget.compose,
        features: widget.features,
      ),
    );
  }
}

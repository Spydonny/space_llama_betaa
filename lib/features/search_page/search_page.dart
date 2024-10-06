import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../ui/widgets/search_page_widgets/planet_gate.dart';
import '../../ui/widgets/search_page_widgets/search_container.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>>? planetData;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchPlanetData();
  }

  Future<void> fetchPlanetData() async {
    try {
      // Fetch all documents from the 'exoplanets' collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('exoplanets')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Extracting the data from each document
        List<Map<String, dynamic>> planets = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        setState(() {
          planetData = planets as List<Map<String, dynamic>>?;
          isLoading = false;
        });
      } else {
        // No documents found
        throw Exception("No documents found in the collection");
      }
    } on FirebaseException catch (e) {
      debugPrint("Firebase error: ${e.message}");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Unknown error: $e");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (hasError) {
      return const Center(child: Text('Error loading data'));
    } else if (planetData == null || planetData!.isEmpty) {
      return const Center(child: Text('No planets found'));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: screenHeight * 0.02),
        const SearchContainer(),
        Expanded(
          child: ListView.builder(
            itemCount: planetData!.length,
            itemBuilder: (context, index) {
              // Get the current planet data
              Map<String, dynamic> planet = planetData![index];

              String imageURL = planet['ImageURL'] ?? '';
              String name = planet['name'] ?? '';
              String size = planet['Size'] ?? '';
              String dist = planet['Distance'] ?? '';
              String habit = planet['Habitability'] ?? '';
              String gravity = planet['Gravity'] ?? '';
              String compose = planet['Composition'] ?? '';
              String features = planet['Unique'] ?? '';

              // Build a widget for each planet
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                child: PlanetGate(
                imageURL: imageURL,
                name: name,
                size: size,
                dist: dist,
                habit: habit,
                gravity: gravity,
                compose: compose,
                features: features,
              )
              );
            },
          ),
        ),
      ],
    );
  }

}

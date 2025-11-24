import 'package:flutter/material.dart';

class GridGalleryScreen extends StatelessWidget {
  const GridGalleryScreen({super.key});

  List<Widget> buildItems(int count) {
    return List.generate(
      count,
      (i) => Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 40),
            const SizedBox(height: 5),
            Text("Item ${i + 1}")
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var items = buildItems(12);

    return Scaffold(
      appBar: AppBar(title: const Text("Grid Gallery")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text("Fixed Column Grid", style: TextStyle(fontSize: 18)),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items,
            ),
            const SizedBox(height: 20),
            const Text("Responsive Grid", style: TextStyle(fontSize: 18)),
            GridView.extent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .8,
              padding: const EdgeInsets.all(12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GreenMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(),
      ),
      body: Stack(
        children: [
          // Map widget (placeholder for actual map)
          Container(
            color: Colors.green[200],
            child: Center(child: Text('Map Placeholder')),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CollectionTypeSelector(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Recycle Centre near me',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}

class CollectionTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCollectionIcon('Dustbin'),
          _buildCollectionIcon('Recycle Bin'),
          _buildCollectionIcon('Collection Center'),
          _buildCollectionIcon('Recycle Bin'),
        ],
      ),
    );
  }

  Widget _buildCollectionIcon(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.delete, size: 40, color: Colors.green),
        Text(label),
      ],
    );
  }
}

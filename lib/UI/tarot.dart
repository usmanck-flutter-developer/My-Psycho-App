import 'package:flutter/material.dart';

// Tarot Readings Page with Search
class TarotReadingsPage extends StatelessWidget {
  final List<String> tarotReadings;
  final String searchQuery;

  const TarotReadingsPage({
    super.key,
    required this.tarotReadings,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filteredReadings =
        tarotReadings
            .where(
              (reading) =>
                  reading.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: filteredReadings.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          color: Colors.white,
          child: ListTile(
            title: Text(
              filteredReadings[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            leading: Icon(Icons.auto_stories, color: Colors.purple),
          ),
        );
      },
    );
  }
}

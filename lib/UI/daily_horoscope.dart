import 'package:flutter/material.dart';

// Daily Horoscope Page with Search
class DailyHoroscopePage extends StatelessWidget {
  final Map<String, String> horoscopes;
  final String searchQuery;

  const DailyHoroscopePage({
    super.key,
    required this.horoscopes,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, String>> filteredHoroscopes =
        horoscopes.entries
            .where(
              (entry) =>
                  entry.key.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return ListView(
      padding: EdgeInsets.all(16.0),
      children:
          filteredHoroscopes.map((entry) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  entry.key,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(entry.value, style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.star, color: Colors.deepPurple),
              ),
            );
          }).toList(),
    );
  }
}

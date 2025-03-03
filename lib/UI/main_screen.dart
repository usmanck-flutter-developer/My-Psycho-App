import 'package:flutter/material.dart';
import 'package:my_psychic_app/UI/daily_horoscope.dart';
import 'package:my_psychic_app/UI/live_chat.dart';
import 'package:my_psychic_app/UI/tarot.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String searchQuery = "";

  final List<String> tarotReadings = [
    'The Fool - New beginnings, innocence, spontaneity',
    'The Magician - Manifestation, resourcefulness, power',
    'The High Priestess - Intuition, wisdom, mystery',
  ];

  final Map<String, String> horoscopes = {
    'Aries': 'Today is a great day for bold decisions.',
    'Taurus': 'Stay calm and trust the process.',
    'Gemini': 'Opportunities are coming your way.',
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Psychic App',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _updateSearchQuery,
              ),
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            TarotReadingsPage(
              tarotReadings: tarotReadings,
              searchQuery: searchQuery,
            ),
            DailyHoroscopePage(
              horoscopes: horoscopes,
              searchQuery: searchQuery,
            ),
            // CustomerSupportPage(searchQuery: searchQuery),
            LiveChatPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories),
              label: 'Tarot',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Horoscope'),
            BottomNavigationBarItem(
              icon: Icon(Icons.support),
              label: 'Support',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

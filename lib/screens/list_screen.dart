import 'package:flutter/material.dart';

import '../data/book_data.dart';
import '../models/book_model.dart';
import '../widgets/book_card.dart';
import '../widgets/custom_drawer.dart';
import 'about_screen.dart';
import 'book_detail_screen.dart';
import 'home_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  void _openBook(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }

  void _openTab(BuildContext context, int index) {
    if (index == 1) {
      return;
    }

    final Widget screen =
        index == 0 ? const HomeScreen() : const AboutScreen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Books')),
      drawer: const CustomDrawer(currentPage: 'Explore Books'),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleBooks.length,
        itemBuilder: (context, index) {
          final Book book = sampleBooks[index];
          return BookCard(
            book: book,
            onTap: () => _openBook(context, book),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) => _openTab(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'Books',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'About'),
        ],
      ),
    );
  }
}

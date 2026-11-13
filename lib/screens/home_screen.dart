import 'package:flutter/material.dart';

import '../data/book_data.dart';
import '../models/book_model.dart';
import '../utils/app_colors.dart';
import '../widgets/book_card.dart';
import '../widgets/custom_drawer.dart';
import 'about_screen.dart';
import 'book_detail_screen.dart';
import 'list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';

  List<Book> get _matchingBooks {
    return sampleBooks.where((book) {
      final String searchText = _searchText.toLowerCase();
      return book.title.toLowerCase().contains(searchText) ||
          book.author.toLowerCase().contains(searchText) ||
          book.category.toLowerCase().contains(searchText);
    }).toList();
  }

  void _openBook(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }

  void _openTab(int index) {
    if (index == 0) {
      return;
    }

    final Widget screen =
        index == 1 ? const ListScreen() : const AboutScreen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (context) => screen),
    );
  }

  Widget _bookSection(String title, List<Book> books) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 122,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 280,
                    child: BookCard(
                      book: books[index],
                      onTap: () => _openBook(books[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Book> books = _matchingBooks;
    final List<Book> popularBooks = books.take(4).toList();
    final List<Book> recentBooks = books.reversed.take(4).toList();

    return Scaffold(
      drawer: const CustomDrawer(currentPage: 'Home'),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 96,
            leading: Builder(
              builder: _buildDrawerButton,
            ),
            title: Text('BookNest'),
            flexibleSpace: FlexibleSpaceBar(
              background: ColoredBox(color: AppColors.darkGreen),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to your library',
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search books, authors, or categories',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (books.isEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('No books found. Try another search.'),
              ),
            )
          else ...[
            _bookSection('Featured Book', [books.first]),
            _bookSection('Popular Books', popularBooks),
            _bookSection('Recently Added Books', recentBooks),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: _openTab,
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

  static Widget _buildDrawerButton(BuildContext context) {
    return IconButton(
      tooltip: 'Open navigation menu',
      icon: const Icon(Icons.menu),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}

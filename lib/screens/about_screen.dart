import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_drawer.dart';
import 'home_screen.dart';
import 'list_screen.dart';

class _BookCategory {
  const _BookCategory(this.name, this.icon, this.color);

  final String name;
  final IconData icon;
  final Color color;
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<_BookCategory> _categories = [
    _BookCategory('Fiction', Icons.auto_stories_outlined, Color(0xFFE7D8C5)),
    _BookCategory('Science', Icons.science_outlined, Color(0xFFDCE8DC)),
    _BookCategory(
      'Technology',
      Icons.computer_outlined,
      Color(0xFFDCE5ED),
    ),
    _BookCategory('History', Icons.account_balance_outlined, Color(0xFFEDE0D8)),
    _BookCategory('Biography', Icons.person_outline, Color(0xFFE8E1C9)),
    _BookCategory(
      'Self-Development',
      Icons.lightbulb_outline,
      Color(0xFFE5DFEA),
    ),
  ];

  void _openTab(BuildContext context, int index) {
    if (index == 2) {
      return;
    }

    final Widget screen =
        index == 0 ? const HomeScreen() : const ListScreen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About BookNest')),
      drawer: const CustomDrawer(currentPage: 'About'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book Categories',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.35,
              ),
              itemBuilder: (context, index) {
                final _BookCategory category = _categories[index];
                return Card(
                  color: category.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category.icon,
                        size: 30,
                        color: AppColors.darkGreen,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.darkGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'About BookNest',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'BookNest is a small personal digital library made for '
              'readers to explore a collection of books in one place.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Purpose',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'This application is a Mobile Application Development '
              'university assignment and a simple example of Flutter.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Main Features',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '• Search the local book collection\n'
              '• Browse book categories\n'
              '• Read details for each sample book\n'
              '• Navigate with the drawer or bottom menu',
            ),
            const SizedBox(height: 16),
            const Text(
              'Developer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Student project'),
            const SizedBox(height: 12),
            const Text('Application version: 1.0.0'),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

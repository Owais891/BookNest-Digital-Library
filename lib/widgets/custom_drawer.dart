import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';
import '../utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.currentPage});

  final String currentPage;

  void _openPage(BuildContext context, String page) {
    Navigator.pop(context);

    if (page == currentPage) {
      return;
    }

    Widget screen;
    if (page == 'Home') {
      screen = const HomeScreen();
    } else if (page == 'Explore Books') {
      screen = const ListScreen();
    } else {
      screen = const AboutScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: AppColors.darkGreen,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: AppColors.white,
                    size: 42,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'BookNest',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your Personal Digital Library',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              selected: currentPage == 'Home',
              onTap: () => _openPage(context, 'Home'),
            ),
            ListTile(
              leading: const Icon(Icons.library_books_outlined),
              title: const Text('Explore Books'),
              selected: currentPage == 'Explore Books',
              onTap: () => _openPage(context, 'Explore Books'),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              selected: currentPage == 'About',
              onTap: () => _openPage(context, 'About'),
            ),
          ],
        ),
      ),
    );
  }
}

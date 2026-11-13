# BookNest – Your Personal Digital Library

BookNest is a small Flutter app for browsing a local collection of sample
books. It uses Material Design 3 and does not need an internet connection or
any third-party runtime packages.

## Run the application

1. Open this folder in Android Studio.
2. Make sure a Flutter SDK and an Android emulator are configured.
3. Run `flutter pub get`.
4. Start the emulator, then run `flutter run`.

## Features

- Animated splash screen that opens Home after three seconds.
- Search by book title, author, or category.
- Ten sample books with ratings and descriptions.
- Book detail pages with back navigation.
- Drawer and bottom navigation for Home, Books, and About.
- A six-category grid on the About page.
- `CustomScrollView` and `SliverAppBar` on Home.

## Project files

- `lib/main.dart` starts the app and sets the Material 3 theme.
- `lib/models/book_model.dart` defines the information stored for a book.
- `lib/data/book_data.dart` contains all ten offline sample books.
- `lib/screens/splash_screen.dart` shows the animated opening screen.
- `lib/screens/home_screen.dart` shows the welcome message, search, and book
  sections.
- `lib/screens/list_screen.dart` displays the complete book list.
- `lib/screens/about_screen.dart` displays six categories and app information.
- `lib/screens/book_detail_screen.dart` shows the selected book's details.
- `lib/widgets/book_card.dart` is the reusable book card.
- `lib/widgets/custom_drawer.dart` contains the drawer navigation.
- `lib/utils/app_colors.dart` contains the app colors.
- `assets/images/` is available for local images if you add them later. The
  current app uses built-in Flutter icons, so no image files are required.

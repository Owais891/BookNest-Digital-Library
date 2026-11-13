import '../models/book_model.dart';

// Local sample books keep the app usable without an internet connection.
const List<Book> sampleBooks = [
  Book(
    id: 1,
    title: 'Atomic Habits',
    author: 'James Clear',
    category: 'Self-Development',
    rating: 4.8,
    description:
        'A practical guide to building good habits, breaking bad ones, '
        'and making small changes that lead to lasting results.',
  ),
  Book(
    id: 2,
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    category: 'Fiction',
    rating: 4.6,
    description:
        'A young shepherd travels in search of treasure and discovers '
        'lessons about listening to his heart and following his dreams.',
  ),
  Book(
    id: 3,
    title: 'Rich Dad Poor Dad',
    author: 'Robert Kiyosaki',
    category: 'Self-Development',
    rating: 4.5,
    description:
        'The author shares lessons about money, work, and financial '
        'education through the ideas of two father figures.',
  ),
  Book(
    id: 4,
    title: 'Think and Grow Rich',
    author: 'Napoleon Hill',
    category: 'Self-Development',
    rating: 4.4,
    description:
        'A classic personal success book about setting goals, staying '
        'focused, and turning plans into action.',
  ),
  Book(
    id: 5,
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    category: 'Science',
    rating: 4.7,
    description:
        'Short stories explain how emotions and personal experiences '
        'influence the way people think about money.',
  ),
  Book(
    id: 6,
    title: 'Deep Work',
    author: 'Cal Newport',
    category: 'Technology',
    rating: 4.5,
    description:
        'A guide to focused work and reducing distractions in a world '
        'that is full of interruptions.',
  ),
  Book(
    id: 7,
    title: 'Ikigai',
    author: 'Hector Garcia',
    category: 'Self-Development',
    rating: 4.3,
    description:
        'The authors explore the Japanese idea of ikigai and share '
        'habits connected with purpose and everyday well-being.',
  ),
  Book(
    id: 8,
    title: 'The Power of Habit',
    author: 'Charles Duhigg',
    category: 'Science',
    rating: 4.4,
    description:
        'An introduction to how habits work and how understanding them '
        'can help people make meaningful changes.',
  ),
  Book(
    id: 9,
    title: 'The 7 Habits of Highly Effective People',
    author: 'Stephen Covey',
    category: 'Self-Development',
    rating: 4.6,
    description:
        'Seven practical habits help readers become more organized, '
        'work well with others, and make thoughtful choices.',
  ),
  Book(
    id: 10,
    title: 'The Subtle Art of Not Giving a F*ck',
    author: 'Mark Manson',
    category: 'Self-Development',
    rating: 4.2,
    description:
        'A direct take on choosing what matters and accepting that '
        'life includes challenges and limits.',
  ),
];

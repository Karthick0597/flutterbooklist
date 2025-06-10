import 'package:flutter/material.dart';
import 'package:task_for_interview/utilities/string.dart';

class Book {
  final String title;
  final String author;
  final String image;

  Book({required this.title, required this.author, required this.image});
}

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<Book> books = [
    Book(title: '1984', author: 'George Orwell', image: "assets/book2.jpg"),
    Book(
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      image: "assets/book.png",
    ),
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      image: "assets/book1.jpg",
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      image: "assets/book2.jpg",
    ),
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      image: "assets/book1.jpg",
    ),
  ];

  // List of additional books to add dynamically
  final List<Book> extraBooks = [
    Book(
      title: 'Brave New World',
      author: 'Aldous Huxley',
      image: "assets/book2.jpg",
    ),
    Book(
      title: 'The Hobbit',
      author: 'J.R.R. Tolkien',
      image: "assets/book.png",
    ),
    Book(
      title: 'Moby-Dick',
      author: 'Herman Melville',
      image: "assets/book1.jpg",
    ),
    Book(
      title: 'The Little Prince',
      author: 'Antoine de Saint-Exupéry',
      image: "assets/book2.jpg",
    ),
    Book(
      title: 'Fahrenheit 451',
      author: 'Ray Bradbury',
      image: "assets/book1.jpg",
    ),
  ];

  int nextBookIndex = 0;

  void _addBook() {
    setState(() {
      books.add(extraBooks[nextBookIndex]);
      nextBookIndex = (nextBookIndex + 1) % extraBooks.length; // Loop around
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Book List',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  book.image,
                  fit: BoxFit.fitWidth,
                  height: 40,
                ),
                title: Text(
                  book.title,
                  style: TextStyle(fontFamily: MyString.poppins),
                ),
                subtitle: Text(
                  book.author,
                  style: TextStyle(fontFamily: MyString.poppins),
                ),
              ),
              Divider(thickness: 0.5, height: 1, color: Colors.grey),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        tooltip: 'Add Book',
        child: const Icon(Icons.add, color: Colors.blue, size: 30),
      ),
    );
  }
}

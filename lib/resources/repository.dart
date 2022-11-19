import 'package:openreads/database/database_controler.dart';
import 'package:openreads/model/book.dart';

class Repository {
  final DatabaseController dbController = DatabaseController();

  Future getAllBooks() => dbController.getAllBooks();

  Future<List<Book>> getBooks(int status) => dbController.getBooks(
        status: status,
      );

  Future<int> countBooks(int status) => dbController.countBooks(status: status);

  Future insertBook(Book book) => dbController.createBook(book);

  Future updateBook(Book book) => dbController.updateBook(book);

  Future deleteBook(int index) => dbController.deleteBook(index);

  Future getBook(int index) => dbController.getBook(index);

  Future<List<Book>> getDeletedBooks() => dbController.getDeletedBooks();
}

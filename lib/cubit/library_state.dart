part of 'library_cubit.dart';

class Audiobook {
  List<File> audioFiles;
  String name;
  Audiobook({required this.name, required this.audioFiles});
}

@immutable
abstract class LibraryState {
  final List<Audiobook> books;
  const LibraryState(this.books);
}

class LibraryInitial extends LibraryState {
  const LibraryInitial() : super(const []);
}
class LibraryLoaded extends LibraryState {
  final List<Audiobook> books;
  const LibraryLoaded(this.books) : super(books);
}

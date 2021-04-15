import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:edify/readFiles.dart';
import 'package:meta/meta.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitial());

  Future<void> loadBooks() async {
    print('LibCubitLoading');
    emit(LibraryInitial());
    List<Audiobook> books = await scanRootDir();
    emit(LibraryLoaded(books));
  }
}

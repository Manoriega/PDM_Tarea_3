import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:libreria/classes/book.dart';

part 'books_finder_event.dart';
part 'books_finder_state.dart';

class BooksFinderBloc extends Bloc<BooksFinderEvent, BooksFinderState> {
  BooksFinderBloc() : super(BooksFinderInitial()) {
    on<SearchEvent>(_onSearchEvent);
    on<ResetSearchEvent>(_onResetEvent);
  }

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter emit) async {
    emit(SearchState());
    try {
      String url =
          "https://www.googleapis.com/books/v1/volumes?q=${event.searchedTitle}";
      print(url);
      final uri = Uri.parse(url), response = await http.get(uri);
      Map<String, dynamic> res = jsonDecode(response.body);
      List<Book> bookLists = [];
      if (res['totalItems'] == 0) {
        emit(SearchFailedState(errorMsg: "No se encontró ningún libro"));
      } else {
        res['items']
            .forEach((book) => {bookLists.add(Book(book['volumeInfo']))});
        emit(SearchSucceedState(books: bookLists));
      }
    } on Exception catch (e) {
      emit(SearchFailedState(
          errorMsg: "Ocurrió un error ineseperado. Vuelve a intentar"));
    }
  }

  FutureOr<void> _onResetEvent(ResetSearchEvent event, Emitter emit) {
    emit(BooksFinderInitial());
  }
}

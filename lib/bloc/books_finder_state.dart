part of 'books_finder_bloc.dart';

abstract class BooksFinderState extends Equatable {
  const BooksFinderState();

  @override
  List<Object> get props => [];
}

class BooksFinderInitial extends BooksFinderState {}

class SearchState extends BooksFinderState {}

class SearchSucceedState extends BooksFinderState {
  final List<Book> books;

  const SearchSucceedState({required this.books});

  @override
  List<Object> get props => [books];
}

class SearchFailedState extends BooksFinderState {
  final String errorMsg;

  const SearchFailedState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

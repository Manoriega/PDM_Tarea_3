part of 'books_finder_bloc.dart';

abstract class BooksFinderEvent extends Equatable {
  const BooksFinderEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends BooksFinderEvent {
  final String searchedTitle;

  const SearchEvent({required this.searchedTitle});

  @override
  // TODO: implement props
  List<Object> get props => [searchedTitle];
}

class ResetSearchEvent extends BooksFinderEvent {}

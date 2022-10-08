import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libreria/bloc/books_finder_bloc.dart';
import 'package:libreria/components/book_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Libreria free to play'),
            backgroundColor: Colors.grey[800]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hoverColor: Colors.grey,
                    suffixIcon: BlocConsumer<BooksFinderBloc, BooksFinderState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is BooksFinderInitial) {
                          return IconButton(
                              onPressed: () {
                                BlocProvider.of<BooksFinderBloc>(context).add(
                                    SearchEvent(
                                        searchedTitle: titleController.text));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ));
                        }
                        return IconButton(
                            onPressed: () {
                              titleController.text = "";
                              BlocProvider.of<BooksFinderBloc>(context)
                                  .add(ResetSearchEvent());
                            },
                            icon: Icon(FontAwesomeIcons.solidCircleXmark));
                      },
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    border: OutlineInputBorder(),
                    labelText: "Ingresa titulo"),
              ),
              Expanded(
                child: BlocConsumer<BooksFinderBloc, BooksFinderState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SearchState) {
                      return loadingView();
                    } else if (state is SearchSucceedState) {
                      List<Widget> list = [];
                      for (var i = 0; i < state.books.length; i++) {
                        list.add(BookItem(book: state.books[i]));
                      }
                      return GridView.count(
                        crossAxisCount: 2,
                        children: list,
                      );
                    } else if (state is BooksFinderInitial) {
                      return Center(
                        child: Text("Ingrese palabra para buscar libro"),
                      );
                    } else if (state is SearchFailedState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Column loadingView() {
    return Column(
      children: const [
        PlayStoreShimmer(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(0),
        ),
        PlayStoreShimmer(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}

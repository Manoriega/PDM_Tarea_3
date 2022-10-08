import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:libreria/bloc/books_finder_bloc.dart';
import 'package:libreria/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksFinderBloc(),
      child: MaterialApp(title: 'Material App', home: HomePage()),
    );
  }
}

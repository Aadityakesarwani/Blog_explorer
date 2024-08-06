import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/services/api_service.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:blog_explorer/bloc/blog_event.dart';
import 'package:blog_explorer/screens/blog_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => BlogBloc(ApiService())..add(FetchBlogs()),
        child: BlogListScreen(),
      ),
    );
  }
}


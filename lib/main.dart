import 'package:api_request_bloc/features/home/home_screen.dart';
import 'package:api_request_bloc/features/post/bloc/post_bloc.dart';
import 'package:api_request_bloc/features/post/ui/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostScreen()
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'homework_bloc.dart';
import 'homework_event.dart';
import 'screens/add_homework_screen.dart';
import 'screens/homework_list_screen.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeworkListScreen(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddHomeworkScreen(),
    ),
  ],
);

void main() {
  runApp(
    
    BlocProvider(
      create: (context) => HomeworkBloc()..add(LoadHomework()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Homework Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../homework_bloc.dart';
import '../homework_state.dart';
import '../homework_info.dart';
import '../homework.dart';

class HomeworkListScreen extends StatelessWidget {
  const HomeworkListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Tracker'),
      ),
      body: BlocBuilder<HomeworkBloc, HomeworkState>(
        builder: (context, state) {
          if (state is HomeworkInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeworkLoaded) {
            if (state.homeworkList.isEmpty) {
              return const Center(
                child: Text('No homework yet'),
              );
            }
          
            final sortedList = List<Homework>.from(state.homeworkList)
              ..sort((a, b) => a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ? 1 : -1));
              
            return ListView.builder(
              itemCount: sortedList.length,
              itemBuilder: (context, index) {
                final homework = sortedList[index];
                return HomeworkInfo(homework: homework);
              },
            );
          }
          return const Center(child: Text('Error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

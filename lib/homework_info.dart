import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homework_bloc.dart';
import 'homework_event.dart';
import 'homework.dart';

class HomeworkInfo extends StatelessWidget {
  final Homework homework;

  const HomeworkInfo({Key? key, required this.homework}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      decoration: homework.isCompleted ? TextDecoration.lineThrough : null,
      color: homework.isCompleted ? Colors.grey : null,
    );

    return ListTile(
      title: Text(homework.description, style: textStyle),
      subtitle: Text(
        '${homework.subject} - Due: ${homework.dueDate.toLocal().toString().split(' ')[0]}',
        style: textStyle,
      ),
      trailing: Checkbox(
        value: homework.isCompleted,
        onChanged: (bool? value) {
          context.read<HomeworkBloc>().add(HomeworkStatus(homework.id));
        },
      ),
    );
  }
}
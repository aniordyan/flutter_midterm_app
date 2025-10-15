import 'homework.dart';

abstract class HomeworkEvent {}

class LoadHomework extends HomeworkEvent {}

class AddHomework extends HomeworkEvent {
  final Homework homework;
  AddHomework(this.homework);
}

class HomeworkStatus extends HomeworkEvent {
  final String homeworkId;
  HomeworkStatus(this.homeworkId);
}
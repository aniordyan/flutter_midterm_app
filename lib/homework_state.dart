import 'homework.dart';

abstract class HomeworkState {}

class HomeworkInitial extends HomeworkState {}

class HomeworkLoaded extends HomeworkState {
  final List<Homework> homeworkList;
  HomeworkLoaded(this.homeworkList);
}
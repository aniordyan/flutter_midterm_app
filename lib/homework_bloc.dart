import 'package:flutter_bloc/flutter_bloc.dart';
import 'homework.dart';
import 'homework_event.dart';
import 'homework_state.dart';

class HomeworkBloc extends Bloc<HomeworkEvent, HomeworkState> {
  HomeworkBloc() : super(HomeworkInitial()) {
    on<LoadHomework>(_onLoadHomework);
    on<AddHomework>(_onAddHomework);
    on<HomeworkStatus>(_onHomeworkStatus);
  }

  void _onLoadHomework(LoadHomework event, Emitter<HomeworkState> emit) {
    emit(HomeworkLoaded([]));
  }

  void _onAddHomework(AddHomework event, Emitter<HomeworkState> emit) {
    if (state is HomeworkLoaded) {
      final updatedList = List<Homework>.from((state as HomeworkLoaded).homeworkList)
        ..add(event.homework);
      emit(HomeworkLoaded(updatedList));
    }
  }

  void _onHomeworkStatus(HomeworkStatus event, Emitter<HomeworkState> emit) {
    if (state is HomeworkLoaded) {
      final List<Homework> originalList = (state as HomeworkLoaded).homeworkList;
      final updatedList = originalList.map((homework) {
        if (homework.id == event.homeworkId) {
          return homework.copyWith(isCompleted: !homework.isCompleted);
        }
        return homework;
      }).toList();
      emit(HomeworkLoaded(updatedList));
    }
  }
}
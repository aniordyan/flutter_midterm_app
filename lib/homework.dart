import 'dart:convert';

class Homework {
  final String id;
  final String subject;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;

  Homework({
    required this.id,
    required this.subject,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  Homework copyWith({
    String? id,
    String? subject,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
  }) {
    return Homework(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../homework_bloc.dart';
import '../homework_state.dart';
import '../homework_event.dart';
import '../homework_info.dart';
import '../homework.dart';

class AddHomeworkScreen extends StatefulWidget {
  const AddHomeworkScreen({Key? key}) : super(key: key);

  @override
  State<AddHomeworkScreen> createState() => _AddHomeworkScreenState();
}

class _AddHomeworkScreenState extends State<AddHomeworkScreen> {
  final _subjectController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    
    if (_subjectController.text.trim().isEmpty ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final newHomework = Homework(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subject: _subjectController.text,
      description: _titleController.text,
      dueDate: _selectedDate!,
    );

    context.read<HomeworkBloc>().add(AddHomework(newHomework));
    context.go('/'); 
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Homework'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(labelText: 'Subject'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : 'Due Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: const Text('Choose Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Save Homework'),
            ),
          ],
        ),
      ),
    );
  }
}
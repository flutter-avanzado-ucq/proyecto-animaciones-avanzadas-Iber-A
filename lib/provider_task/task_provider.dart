import 'package:flutter/material.dart';

class Task {
  String title;
  bool done;
  DateTime? dueDate; // Agregar esta linea para la fecha

//practica se agrega parametro de fecha
  Task({required this.title, this.done = false, this.dueDate}); //Actualizar el contructor
}

//Es como el set state, cuando se llame desde otro widget se va a actualizar el dise;o
class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, {DateTime? dueDate}) { // agregar el dueDate parameter
    _tasks.insert(0, Task(title: title, dueDate: dueDate)); // Pasar dueDate to the constructor
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].done = !_tasks[index].done;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
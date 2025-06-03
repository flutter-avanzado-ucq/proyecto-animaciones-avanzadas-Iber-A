import 'package:flutter/material.dart';
// Se agregaron nuevos paquetes
import 'package:provider/provider.dart';
import 'package:tareas/provider_task/task_provider.dart';
import 'package:intl/intl.dart'; // Import DateFormat

class AddTaskSheet extends StatefulWidget {
  //Eliminar codigo
  // final Function(String) onSubmit;

//Eliminar lña linea: requiered this.onSubmit
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final _controller = TextEditingController();
  DateTime? _selectedDate;
    // Funcion para la fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Fecha inicial
      firstDate: DateTime.now(), // Fecha más reciente que se puede seleccionar
      lastDate: DateTime(2101), // Ultima fecha permitida
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // funcion para agregar tarea
  void _submit() {
    final title = _controller.text.trim();
    if (title.isNotEmpty) {
      // Obtén la instancia de TaskProvider
      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      // Llamada a addTask con el titulo y la fecha seleccionada
      taskProvider.addTask(title, dueDate: _selectedDate);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Agregar nueva tarea', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 12),

          // Button to select date
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text(_selectedDate == null
                ? 'Seleciona una fecha de vencimiento'
                : 'Fecha de vencimiento: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}'),
          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.check),
            label: const Text('Agregar tarea'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
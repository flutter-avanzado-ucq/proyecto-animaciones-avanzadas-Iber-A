## Cambios

1.  Agregar task_provider y actualizar tarea_screen
2.  Agregar dependencias
3.  Eliminar codigo

## Funcionalidad de Fecha de Vencimiento

Se ha añadido la funcionalidad para gestionar la fecha de vencimiento de las tareas:
1 Se agregó un campo `dueDate` al modelo `Task` para almacenar la fecha de vencimiento.
2 Se implementó la selección de fecha en la hoja para agregar nuevas tareas (`AddTaskSheet`).
3 La fecha de vencimiento ahora se muestra debajo del título de la tarea en la tarjeta de tarea (`TaskCard`).
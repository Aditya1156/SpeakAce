
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatefulWidget {
  final String routine;
  const TimelineWidget({super.key, required this.routine});

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _parseRoutine(widget.routine);
  }

  void _parseRoutine(String routine) {
    final List<Map<String, dynamic>> tasks = [];
    final lines = routine.split('\n');
    for (final line in lines) {
      final parts = line.split(' - ');
      if (parts.length == 3) {
        tasks.add({
          'time': parts[0],
          'event': parts[1],
          'icon': _getIconData(parts[2]),
        });
      }
    }
    setState(() {
      _tasks = tasks;
    });
  }

  IconData _getIconData(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'wb_sunny':
        return Icons.wb_sunny;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'free_breakfast':
        return Icons.free_breakfast;
      case 'work':
        return Icons.work;
      case 'school':
        return Icons.school;
      case 'book':
        return Icons.book;
      case 'computer':
        return Icons.computer;
      case 'run_circle':
        return Icons.run_circle;
      case 'sports_gymnastics':
        return Icons.sports_gymnastics;
      case 'self_improvement':
        return Icons.self_improvement;
      case 'spa':
        return Icons.spa;
      default:
        return Icons.task;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (_tasks.isEmpty)
          const Center(
            child: Text('No routine generated yet.'),
          )
        else
          for (int i = 0; i < _tasks.length; i++)
            TaskTimelineTile(
              isFirst: i == 0,
              isLast: i == _tasks.length - 1,
              event: _tasks[i]['event'],
              time: _tasks[i]['time'],
              icon: _tasks[i]['icon'],
            ),
      ],
    );
  }
}

class TaskTimelineTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final String event;
  final String time;
  final IconData icon;

  const TaskTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.event,
    required this.time,
    required this.icon,
  });

  @override
  State<TaskTimelineTile> createState() => _TaskTimelineTileState();
}

class _TaskTimelineTileState extends State<TaskTimelineTile> {
  bool _isDone = false;

  void _toggleDone() {
    setState(() {
      _isDone = !_isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _isDone ? 0.3 : 1.0,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        indicatorStyle: IndicatorStyle(
          width: 40,
          height: 40,
          indicator: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isDone ? Colors.grey : Colors.blue,
            ),
            child: Icon(widget.icon, color: Colors.white, size: 20),
          ),
        ),
        beforeLineStyle: LineStyle(
          color: _isDone ? Colors.grey : Colors.blue,
          thickness: 2,
        ),
        afterLineStyle: LineStyle(
          color: _isDone ? Colors.grey : Colors.blue,
          thickness: 2,
        ),
        endChild: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.event,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: _isDone ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(widget.time),
                    Checkbox(
                      value: _isDone,
                      onChanged: (value) => _toggleDone(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

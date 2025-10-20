
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TaskTimelineTile(
          isFirst: true,
          isLast: false,
          event: 'Wake up',
          time: '7:00 AM',
          icon: Icons.wb_sunny,
        ),
        TaskTimelineTile(
          isFirst: false,
          isLast: false,
          event: 'Morning Workout',
          time: '7:30 AM',
          icon: Icons.fitness_center,
        ),
        TaskTimelineTile(
          isFirst: false,
          isLast: false,
          event: 'Breakfast',
          time: '8:30 AM',
          icon: Icons.free_breakfast,
        ),
        TaskTimelineTile(
          isFirst: false,
          isLast: true,
          event: 'Start Work',
          time: '9:00 AM',
          icon: Icons.work,
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
                Text(
                  widget.event,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: _isDone ? TextDecoration.lineThrough : TextDecoration.none,
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

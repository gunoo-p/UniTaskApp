import 'package:flutter/material.dart';
import 'package:unitask/app/theme/preview.dart';
import 'package:unitask/core/enum/priority.dart';

@AppThemePreview(group: 'Badge', name: '우선순위')
Widget preview() {
  return Row(
    spacing: 10,
    children: const [
      PriorityBadge(priority: Priority.low),
      SizedBox(width: 8),
      PriorityBadge(priority: Priority.mid),
      SizedBox(width: 8),
      PriorityBadge(priority: Priority.high),
    ],
  );
}


class PriorityBadge extends StatelessWidget {

  final Priority priority;

  const PriorityBadge({
    super.key,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: priority.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: .circle,
              color: priority.primary,
            ),
          ),
          Text(
            priority.title,
            style: TextStyle(
              color: priority.primary,
              fontSize: 12,
            fontWeight: .w700,
            ),
          ),
        ],
      ),
    );
  }
}
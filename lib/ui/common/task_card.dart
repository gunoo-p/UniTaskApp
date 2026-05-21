import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TaskCard extends StatelessWidget {
  final bool checked;
  final String title;
  final DateTime date;
  final VoidCallback? onSelected;
  final Function(bool? value)? onChecked;
  final Widget category;
  

  const TaskCard({
    super.key,
    required this.checked,
    required this.title,
    required this.date,
    this.onSelected,
    this.onChecked,
    required this.category,
  
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              category,
              Checkbox(
                onChanged: onChecked,
                value: checked,
              ),
            ],
          ),
          Text(title),
          const Row(
            children: [
              Icon(
                LucideIcons.calendar,
              ),
              Text(
                // TODO: 담에 해야함
              ),
            ],
          ),
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final Widget destination;
  final String content;
  final DateTime modified;
  final VoidCallback? onTap;

  const NoteCard({
    super.key,
    required this.title,
    required this.destination,
    required this.content,
    required this.modified,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap ?? () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Zmodyfikowano: ${_formatDate(modified)}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

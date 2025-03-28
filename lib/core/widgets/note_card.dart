import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final Widget destination;
  final String content;
  final DateTime modified; // Changed to DateTime

  const NoteCard({
    super.key,
    required this.title,
    required this.destination,
    required this.content,
    required this.modified,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        borderRadius: BorderRadius.circular(8), // Adds a tap effect on rounded corners
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Note Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Note Content (Preview)
              Text(
                content,
                maxLines: 3, // Limit to 3 lines
                overflow: TextOverflow.ellipsis, // Add "..."
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),

              // Last Modified Date
              Row(
                children: [
                  const Text('Ostatnia modyfikacja: '),
                  Text(
                    DateFormat('dd.MM.yyyy HH:mm').format(modified), // Format date
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

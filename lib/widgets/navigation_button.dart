import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final Widget destination;
  final String description;
  final String filename;

  const NavigationButton({super.key, required this.title, required this.destination, required this.description, required this.filename});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description, style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 4),
              Text(filename, style: TextStyle(color: Colors.grey[500], fontSize: 12, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title will be here',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0E104B),
                  fontWeight: FontWeight.w700),
            ),
            const Text('Description will be here'),
            const Text(
              'Date 10/05/2025',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
            ),
            Row(
              children: [
                Chip(
                  label: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.deepOrange,
                  side: BorderSide.none,
                ),
                const Spacer(),
                IconButton.filledTonal(
                    onPressed: () {}, icon: Icon(Icons.delete)),
                IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummarySection(),
            ListView.separated(
              itemCount: 6,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) =>const SizedBox(height: 8),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SummaryCard(
              title: 'New',
              count: 12,
            ),
            SummaryCard(
              title: 'Progress',
              count: 44,
            ),
            SummaryCard(
              title: 'Completed',
              count: 3,
            ),
            SummaryCard(
              title: 'Cancelled',
              count: 25,
            )
          ],
        ),
      ),
    );
  }
}

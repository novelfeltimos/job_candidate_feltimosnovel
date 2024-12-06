import 'package:flutter/material.dart';
import 'package:job_candidate_app/models/candidate.dart';

class CandidateCard extends StatelessWidget {
  final Candidate candidate;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const CandidateCard({
    Key? key,
    required this.candidate,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            candidate.name[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          candidate.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(candidate.position),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

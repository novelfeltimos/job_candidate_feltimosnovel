import 'package:flutter/material.dart';

class Candidate {
  int id;
  String name;
  String position;

  Candidate({required this.id, required this.name, required this.position});
}

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
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15.0),
        title: Text(
          candidate.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(candidate.position),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidate> candidates = [];

  @override
  void initState() {
    super.initState();
    fetchCandidates();
  }

  // Fetch candidates (mock data)
  Future<void> fetchCandidates() async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate delay
      setState(() {
        candidates = [
          Candidate(id: 1, name: 'Alice Johnson', position: 'Software Engineer'),
          Candidate(id: 2, name: 'Michael Williams', position: 'UI/UX Designer'),
          Candidate(id: 3, name: 'Emma Davis', position: 'Product Manager'),
          Candidate(id: 4, name: 'James Miller', position: 'Data Scientist'),
          Candidate(id: 5, name: 'Olivia Wilson', position: 'Marketing Specialist'),
        ];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load candidates: $e')),
      );
    }
  }

  // Delete candidate by ID
  void deleteCandidate(int id) {
    setState(() {
      candidates.removeWhere((candidate) => candidate.id == id);
    });
  }

  // Edit candidate
  void editCandidate(int id) {
    final candidate = candidates.firstWhere((candidate) => candidate.id == id);
    TextEditingController nameController = TextEditingController(text: candidate.name);
    TextEditingController positionController = TextEditingController(text: candidate.position);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Candidate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: positionController,
                decoration: const InputDecoration(labelText: 'Position'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Recreate the candidate object to trigger proper update
                  final updatedCandidate = Candidate(
                    id: candidate.id,
                    name: nameController.text,
                    position: positionController.text,
                  );
                  candidates[candidates.indexWhere((c) => c.id == id)] = updatedCandidate;
                });
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the dialog without saving
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates'),
      ),
      body: candidates.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator if empty
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                return CandidateCard(
                  candidate: candidates[index],
                  onDelete: () => deleteCandidate(candidates[index].id),
                  onEdit: () => editCandidate(candidates[index].id),
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CandidateListPage(),
  ));
}

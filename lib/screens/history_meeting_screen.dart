import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone_tutorial/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: (snapshots.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Room Name: ${(snapshots.data! as dynamic).docs[index]['meetingName']}',
            ),
            subtitle: Text('Joined On ${DateFormat.yMMMd().format((snapshots.data! as dynamic).docs[index]['createdAt'].toDate())}'),
          ),
        );
      },
    );
  }
}

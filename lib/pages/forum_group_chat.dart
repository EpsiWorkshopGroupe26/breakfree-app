import 'package:breakfree/pages/tabs/forum_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForumGroupChatPage extends StatelessWidget {
  final int groupId;

  ForumGroupChatPage({required this.groupId});

  @override
  Widget build(BuildContext context) {
    final group = groups.firstWhere((group) => group.id == groupId);

    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to ${group.name} forum!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  // Dummy chat content for now
                  ListTile(
                    title: Text('User1'),
                    subtitle:
                        Text('This is a message in the ${group.name} forum.'),
                  ),
                  ListTile(
                    title: Text('User2'),
                    subtitle: Text('Another message in this forum discussion.'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'You can view discussions here, but cannot post any messages.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

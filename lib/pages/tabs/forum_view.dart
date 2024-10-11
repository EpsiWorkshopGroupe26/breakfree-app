import 'package:breakfree/pages/forum_group_chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ForumGroup> groups = [
  ForumGroup(
    id: 1,
    name: 'Contre l\'alcoolisme',
    description:
        'Nous sommes là pour vous aider à lutter contre ce poison qu\'est l\'alcool.',
  ),
  ForumGroup(
    id: 2,
    name: 'A bas le tabac',
    description: 'Vous voulez arrêter de fumer ? Venez discuter avec nous.',
  ),
  ForumGroup(
    id: 3,
    name: 'Drogues en tout genre',
    description:
        'Vous avez des problèmes avec la drogue ? Nous sommes là pour vous aider.',
  ),
  ForumGroup(
    id: 4,
    name: 'Jeux d\'argent',
    description:
        'Vous avez des problèmes avec les jeux d\'argent ? Venez en discuter avec nous.',
  ),
];

class ForumGroup {
  final int id;
  final String name;
  final String description;

  ForumGroup({required this.id, required this.name, required this.description});
}

class ForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum Groups'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ForumGroupChatPage(groupId: group.id)),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        group.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

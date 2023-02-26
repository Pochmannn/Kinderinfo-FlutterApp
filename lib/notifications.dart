import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        NameAndAvatar(),
        Flexible(child: NotificationsList()),
        SizedBox(height: 25)
      ],
    ));
  }
}

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 77, 152, 187)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Flexible(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'Powiadomienia',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(child: NotificationListView()),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var widthVar = MediaQuery.of(context).size.width;
    var heightVar = MediaQuery.of(context).size.height;

    var paddingVar = MediaQuery.of(context).padding;
    var safeHeightVar = heightVar - paddingVar.top - paddingVar.bottom;

    if (appState.notification.isEmpty) {
      return const Center(
        child: Text('Brak powiadomień.'),
      );
    }

    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 50.0,
          maxWidth: widthVar - 100,
          minHeight: 100.0,
          maxHeight: heightVar,
        ),
        child: Flexible(
          child: Card(
            child: ClipRect(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  for (var notif in appState.notification)
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: Text(
                        notif,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}

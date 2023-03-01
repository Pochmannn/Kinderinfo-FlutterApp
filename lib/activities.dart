import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Column(
      children: [
        const NameAndAvatar(),
        Expanded(
          child: SingleChildScrollView(
            child: Flexible(
              child: ListView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  MondayActivities(appState: appState),
                  TuesdayActivities(appState: appState),
                  WednesdayActivities(appState: appState),
                  WednesdayActivities(appState: appState),
                  WednesdayActivities(appState: appState),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class MondayActivities extends StatelessWidget {
  const MondayActivities({
    Key? key,
    required this.appState,
  }) : super(key: key);

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 43, 203),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Poniedziałek',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 12,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 186, 172, 221),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var mon in appState.monday)
                  ListTile(
                    leading: const Icon(Icons.book_online),
                    title: Text(
                      mon,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TuesdayActivities extends StatelessWidget {
  const TuesdayActivities({
    Key? key,
    required this.appState,
  }) : super(key: key);

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 186, 172, 221),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Wtorek',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 12,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 88, 43, 203),
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                for (var tue in appState.tuesday)
                  ListTile(
                    leading: const Icon(Icons.book_online),
                    title: Text(
                      tue,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WednesdayActivities extends StatelessWidget {
  const WednesdayActivities({
    Key? key,
    required this.appState,
  }) : super(key: key);

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 88, 43, 203),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Środa',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 12,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 186, 172, 221),
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                for (var wed in appState.wednesday)
                  ListTile(
                    leading: const Icon(Icons.book_online),
                    title: Text(
                      wed,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

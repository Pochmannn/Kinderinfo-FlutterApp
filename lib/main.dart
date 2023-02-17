import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifications.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color.fromARGB(255, 213, 221, 221),
          ),
          home: const MyHomePage(
            title: "Kinderinfo",
          ),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  List notification = [
    "Obiad zjedzony",
    "Drzemka odbyta",
    "Popołudniowy spacer odbyty"
  ];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  void nothing() {}

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home),
            label: 'Strona Główna',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.man_outlined),
            icon: Icon(Icons.man),
            label: 'Profil Dziecka',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_outlined),
            icon: Icon(Icons.settings),
            label: 'Ustawienia',
          ),
        ],
      ),
      body: <Widget>[
        const Mpage(),
        const Profile(),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}

class Mpage extends StatelessWidget {
  const Mpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      NameAndAvatar(),
      SizedBox(height: 25),
      Banner(),
      SizedBox(height: 15),
      Buttons()
    ]);
  }
}

class NameAndAvatar extends StatelessWidget {
  const NameAndAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                Text(
                  'Witaj!',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..color = const Color.fromARGB(255, 8, 17, 27),
                  ),
                ),
                Text(
                  'Michał Pochmara',
                  style: TextStyle(
                    fontSize: 22,
                    foreground: Paint()
                      ..color = const Color.fromARGB(255, 8, 17, 27),
                  ),
                ),
              ]),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color.fromARGB(255, 66, 5, 222),
                    width: 6,
                  ),
                ),
                child: Image.asset(
                  'assets/images/patrick1.jpg',
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Banner extends Mpage {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 325,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 240, 163, 163),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 15.0,
              bottom: 15.0,
            ),
            child: Text(
              'Zobacz co nowego u twojego dziecka!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ))
    ]);
  }
}

class Buttons extends Mpage {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(40),
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        crossAxisCount: 2,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 86, 54, 244)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Notifications()),
              );
            },
            child: const Text(
              'Powiadomienia',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 186, 181, 212)),
            ),
            onPressed: nothing(),
            child: const Text(
              'Chat z Nauczycielem',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 240, 163, 163)),
            ),
            onPressed: nothing(),
            child: const Text(
              'Zajęcia',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 110, 106, 110)),
            ),
            onPressed: nothing(),
            child: const Text(
              'Płatności',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    ]);
  }

  nothing() {}
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      NameAndAvatar(),
      SizedBox(height: 25),
      BannerProfile(),
      SizedBox(height: 25),
      ListProfile(),
      SizedBox(height: 25)
    ]);
  }
}

class ListProfile extends StatelessWidget {
  const ListProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: 325,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 165, 206, 225)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color.fromARGB(255, 20, 222, 5),
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/patrick1.jpg',
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              const Text('Jerzy Pochmara',
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 62, 85, 210)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('ID dziecka:',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('270195',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('Grupa:',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('Leśna',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('data urodzenia:',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('22.03.2005',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('imię matki:',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('Janina',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('imię ojca:',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('Michał',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

class BannerProfile extends StatelessWidget {
  const BannerProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Profil dziecka',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        NameAndAvatar(),
        NotificationsList(),
        SizedBox(height: 50)
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 77, 152, 187)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
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
                    NotificationListView(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.notification.isEmpty) {
      return const Center(
        child: Text('Brak powiadomień.'),
      );
    }

    return SizedBox(
      width: 250,
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

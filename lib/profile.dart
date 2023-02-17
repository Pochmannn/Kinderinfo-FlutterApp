import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

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

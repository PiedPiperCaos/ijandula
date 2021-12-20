import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ijandula/services/firebase.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, //Inhabilita el botón del dispositivo para volver atrás
      child: Scaffold(
        body: Stack(
          children: [
            //Background
            Background(),

            //Content
            Content(),
          ],
        ),

        //BottomNavigationBar
        //bottomNavigationBar: NavigationBar(),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 150, color: Color(0xff005298)),
        Container(color: Colors.white),
      ],
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: 5),

              //Titulo
              Text(
                "iJándula",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              //Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 100,
                width: 330,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          user!.displayName.toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: SizedBox(width: 60)),
                        GestureDetector(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.power_settings_new,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    Text("Cerrar sesión",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () async {
                              FirebaseService service = new FirebaseService();
                              try {
                                await service.signOutFromGoogle();
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  print(e.message!);
                                }
                              }
                              ;
                              Navigator.pushNamed(
                                  context, "loginFireBase_screen");
                            })
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I.E.S Jándula",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "Perfil Profesorado",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    color: Colors.blue),

                /*child: Row(
                  children: [
                    SizedBox(width: 45),
                    Icon(Icons.alarm, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Avisos",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 38),
                    VerticalDivider(
                      color: Colors.white, 
                      indent: 8,
                      endIndent: 8,
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.book_outlined, color: Colors.white), 
                    SizedBox(width: 7),
                    Text("Bandeja de firmas",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),*/
              ),

              //Table
              Container(
                margin: EdgeInsets.all(15),
                child: Table(
                  border: TableBorder(
                    verticalInside: BorderSide(
                      width: 1.5,
                      color: Color(0xffeeeeee),
                    ),
                    horizontalInside: BorderSide(
                      width: 1.5,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  children: [
                    TableRow(children: [
                      GestureDetector(
                        child: _SingleCard(
                            icon: "assets/profesor.png",
                            text: "Personal del centro"),
                        onTap: () =>
                            Navigator.pushNamed(context, "personal_screen"),
                      ),
                      GestureDetector(
                          child: _SingleCard(
                              icon: "assets/sombrero.png",
                              text: "Alumnado del centro"),
                          onTap: () =>
                              Navigator.pushNamed(context, "alumnado")),
                      GestureDetector(
                        child: _SingleCard(icon: "assets/covid.png", text: "Convivencia"),
                        onTap: () =>
                              Navigator.pushNamed(context, "convivencia")
                        )
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          child: _SingleCard(
                              icon: "assets/campana.png", text: "DACE"),
                          onTap: () =>
                              Navigator.pushNamed(context, "dace_screen")),
                      _SingleCard(icon: "assets/calendario.png", text: "Baño"),
                      _SingleCard(icon: "", text: "")
                    ]),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String icon;
  final String text;

  const _SingleCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == "") {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
        child: Column(
          children: [
            Container(
              height: 44,
              width: 45,
              child: Image.asset(this.icon),
            ),
            SizedBox(height: 10),
            Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 12,
        selectedItemColor: Color(0xff005298),
        unselectedItemColor: Color(0xffbcbcbc),
        showUnselectedLabels: true,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off), label: "Agenda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_rounded),
              label: "Comunicaciones"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menú"),
        ]);
  }
}

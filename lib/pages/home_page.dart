import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:resposividade/pages/bottomNavPages/perfil_page.dart';
import 'package:resposividade/style/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: 120,
          height: 60,
          child: Image.asset(
            'assets/images/logo-educacao.png',
          ),
        ),
        backgroundColor: AppStyle.secondColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: PerfilPage(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 100))),
            icon: Icon(
              Icons.person,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: AppStyle.mainColor,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 389) {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppStyle.shadowMainColor,
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: Offset(0.0, 2.0)),
                        ],
                        color: AppStyle.secondColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28))),
                    child: GestureDetector(
                      child: Container(
                        margin:
                        EdgeInsets.only(bottom: constraints.maxHeight / 6.5),
                        child: Image.asset('assets/images/banner.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 3.0),
                          child: Text("Aulas",
                              style: GoogleFonts.roboto(
                                  color: AppStyle.titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 30, right: 3),
                            children: [
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/biomas.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/angulos.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/adverbio.png'),
                                ),
                              ),
                              Container(
                                width: 185,
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/banner2.png',
                                    height: 170,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 3.0),
                          child: Text("Meus Favoritos",
                              style: GoogleFonts.roboto(
                                  color: AppStyle.titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 30, right: 3),
                            children: [
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/adverbio.png'),
                                ),
                              ),
                              Container(
                                width: 185,
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/banner2.png',
                                    height: 165,
                                  ),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/angulos.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                  Image.asset('assets/images/biomas.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ));
        } else {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppStyle.shadowMainColor,
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: Offset(0.0, 2.0)),
                        ],
                        color: AppStyle.secondColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28))),
                    child: GestureDetector(
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: constraints.maxHeight / 6),
                        child: Image.asset('assets/images/banner.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.29),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                          height: 70,
                          padding: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: AppStyle.cardFloatingColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: Container(
                            margin: EdgeInsets.only(left: 120.0, top: 10.0),
                            child: Text(
                              "Assista as aulas e fa??a as atividades para voc?? subir no P??dio!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.27,
                      left: MediaQuery.of(context).size.width * 0.12,
                      child: Image.asset(
                        'assets/images/podio.png',
                        height: 80,
                        width: 80,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                          child: Text("Aulas",
                              style: GoogleFonts.roboto(
                                  color: AppStyle.titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 30, right: 3),
                            children: [
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/biomas.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/angulos.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/adverbio.png'),
                                ),
                              ),
                              Container(
                                width: 185,
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/banner2.png',
                                    height: 170,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                          child: Text("Meus Favoritos",
                              style: GoogleFonts.roboto(
                                  color: AppStyle.titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 30, right: 3),
                            children: [
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/adverbio.png'),
                                ),
                              ),
                              Container(
                                width: 185,
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/banner2.png',
                                    height: 165,
                                  ),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/angulos.png'),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 170,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/biomas.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ));
        }
      }),
    );
  }
}

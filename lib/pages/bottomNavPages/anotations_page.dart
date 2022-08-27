import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:resposividade/pages/anotations/create_anotation.dart';
import 'package:resposividade/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../style/app_style.dart';

class AnotationPage extends StatefulWidget {
  const AnotationPage({Key? key}) : super(key: key);

  @override
  State<AnotationPage> createState() => _AnotationPageState();
}

List _anotacoes = [];

class _AnotationPageState extends State<AnotationPage> {
  _getAnotations() async {
    SharedPreferences idALuno = await SharedPreferences.getInstance();
    String id = idALuno.getString('id')!;
    print(id);
    List<dynamic> values = id.split("Id ");
    var url = Uri.parse(
        'https://mais-educacao.herokuapp.com/anotacoesByAluno/2982e774-d647-45ac-950c-7da37d11d8e3');
    var resposta = await http.get(url);
    if (resposta.statusCode == 201) {
      Map<String, dynamic> map = jsonDecode(resposta.body);
      List<dynamic> data = map["anotacoes"];
      setState(() {
        _anotacoes = data;
      });
      print(_anotacoes);
      return data;
    } else {
      throw Exception('Nao foi possivel carregar anotacoes');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAnotations();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
        elevation: 0,
        title: Text("Minhas Anotações",
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),
            textAlign: TextAlign.center),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
          ),
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
                    child: LoginPage(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 10))),
            icon: Icon(
              Icons.person,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: AppStyle.mainColor,
      body: LayoutBuilder(builder: (_, constraints) {
        return Container(
          height: constraints.maxHeight,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _anotacoes.length,
            itemBuilder: (context, int index) {
              return Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(

                  children: [
                    Text(
                      _anotacoes[index]['descricao'],
                      style: GoogleFonts.roboto(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text('#${_anotacoes[index]['tags'][0]['name']}',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            )),
                        SizedBox(width: 3,),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text('#${_anotacoes[index]['tags'][1]['name']}',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            )),
                        SizedBox(width: 3,),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text('#${_anotacoes[index]['tags'][2]['name']}',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            )),
                        SizedBox(width: 3,),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        focusColor: AppStyle.secondColor,
        backgroundColor: AppStyle.secondColor,
        elevation: 2,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: CreateAnotation(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 10)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

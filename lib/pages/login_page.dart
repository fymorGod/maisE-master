import 'dart:convert';
import 'package:resposividade/pages/bar_item_page.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style/app_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _matController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppStyle.secondColor,
        body: Form(
          key: _formKey,
          child: LayoutBuilder(
              builder: (_,constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 50.0),
                            child: Image.asset("assets/images/logo-educacao.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, bottom: 10.0, left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _matController,
                              validator: (matricula){
                                if (matricula == null || matricula.isEmpty){
                                  return 'Por favor, digite sua matrícula';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "753.145.574-01",
                                labelStyle: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black26
                                ),
                                border: UnderlineInputBorder(
                                    borderRadius:BorderRadius.circular(8.0)),
                              ),
                              obscureText: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (senha){
                                if(senha == null || senha.isEmpty){
                                  return "Por favor, digite sua senha";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "*******************",
                                labelStyle: TextStyle(
                                    fontSize: 28 ,
                                    color: Colors.black26
                                ),
                                border: UnderlineInputBorder(
                                    borderRadius:BorderRadius.circular(8.0)),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              "Esqueceu sua senha?",
                              style: GoogleFonts.roboto(
                                  color: Colors.white70
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: constraints.maxWidth * 0.70,
                            height: constraints.maxHeight * 0.07,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if(_formKey.currentState!.validate()){
                                  bool confirm = await login();
                                  if(!currentFocus.hasPrimaryFocus){
                                    currentFocus.unfocus();
                                  }
                                  if(confirm){
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(
                                      builder: (context) => BarItemPage(),
                                    )
                                    );
                                  } else {
                                    _passwordController.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff364fc7)
                              ),
                              child: Container(
                                child: Text("Entrar", style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                );
              }
          ),
        ),
      ),
    );
  }
  final snackBar = SnackBar(content: Text('e-mail ou senha são inválidos',
    textAlign: TextAlign.center,
  ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> login () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SharedPreferences idAluno = await SharedPreferences.getInstance();
    SharedPreferences idSenha = await SharedPreferences.getInstance();

    Response response = await post(
      Uri.parse('http://192.168.6.20:3010/escolas/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'mat' : _matController.text,
        'password' : _passwordController.text
      }),
    );
    if (response.statusCode == 200){
      await sharedPreferences.setString('token', "Token ${jsonDecode(response.body)['token']}");
      await idAluno.setString('id', jsonDecode(response.body)['user']["id"]);
      await idSenha.setString('id_senha', jsonDecode(response.body)['user']["id_senha"]);
      // print(idSenha.getString('id_senha'));
      return true;
    } else {
      return false;
    }
  }
}
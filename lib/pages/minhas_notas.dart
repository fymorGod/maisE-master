import 'package:page_transition/page_transition.dart';
import 'package:resposividade/pages/bottomNavPages/perfil_page.dart';
import 'package:resposividade/style/app_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';



class MinhasNotasPage extends StatefulWidget {
  const MinhasNotasPage({Key? key}) : super(key: key);




  @override
  State<MinhasNotasPage> createState() => _MinhasNotasPageState();
}

class _MinhasNotasPageState extends State<MinhasNotasPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Mat', 8.5, Colors.orange),
      _ChartData('Port', 7, Colors.teal),
      _ChartData('Geo', 10, Colors.red),
      _ChartData('Hist', 6.4, Colors.indigo),
      _ChartData('Filo', 6, Colors.purple),
      _ChartData('Ing', 9.9, Colors.deepOrange),
      _ChartData('Fis', 5.5, Colors.green),
      _ChartData('Ed.Fis', 10, Colors.blue),
      _ChartData('Info', 10, Colors.brown),
      _ChartData('Bio', 7, Colors.grey),
      _ChartData('Fis II', 8.3, Colors.cyanAccent),
      _ChartData('Mat II', 7, Colors.cyan),

    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 120,
          height: 60,
          child: Image.asset('assets/images/logo-educacao.png',),
        ),
        backgroundColor: AppStyle.secondColor,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined,
            size: 25,
            color: Colors.white,
          ),
          ),
          IconButton(onPressed: () => Navigator.push(context, PageTransition(
              child: const PerfilPage(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 10)
          )), icon: Icon(Icons.person,
            size: 25,
            color: Colors.white,
          ),
          ),
        ],

      ),
      backgroundColor: Color(0xfff1f3f5),
      body: Container(
        color: AppStyle.mainColor,
        width: size.width,
        height: size.height,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
                    child: Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text("Minhas Notas", style: TextStyle(color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold, fontFamily: "Roboto"),),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                      Container(
                        child: Image.asset('assets/images/grafico.png',
                          width: 30,
                          height: 30,),
                      ),
                      SizedBox(width: 15,),
                      Text("Melhor mat??ria: ", style: TextStyle(color: Color(0xff495057), fontFamily: 'Roboto'),),
                      Text("Geografia", style: TextStyle(color: Color(0xff868E96), fontFamily: 'Roboto'),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                      Container(
                        child: Image.asset('assets/images/relogio.png',
                          width: 30,
                          height: 30,),
                      ),
                      SizedBox(width: 15,),
                      Text("Tempo na Plataforma: ", style: TextStyle(color: Color(0xff495057), fontFamily: 'Roboto'),),
                      Text("15 Minutos", style: TextStyle(color: Color(0xff868E96), fontFamily: 'Roboto'),)
                    ],
                  ),
                  SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child:SfCartesianChart(
                          primaryXAxis: CategoryAxis(maximum: 12, minimum: 0),
                          primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 2),
                          tooltipBehavior: _tooltip,
                          series: <ChartSeries<_ChartData, String>>[
                            ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              pointColorMapper:(_ChartData data, _) => data.color,
                              borderWidth: 10,
                              name: 'Desempenho',
                            )
                          ]
                      )
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                              headingRowHeight: 22,
                              dataRowHeight: 24,
                              sortAscending: true,
                              columns: [
                                DataColumn(label: Text("Material", style: TextStyle(fontSize: 16, color: Color(0xff868E96), fontFamily: 'Roboto'),)),
                                DataColumn(label: Text("Frequ??ncia", style: TextStyle(fontSize: 16, color: Color(0xff868E96), fontFamily: 'Roboto'),)),
                                DataColumn(label: Text("Atividades", style: TextStyle(fontSize: 16, color: Color(0xff868E96), fontFamily: 'Roboto'),)),
                                DataColumn(label: Text("M??dias", style: TextStyle(fontSize: 16, color: Color(0xff868E96), fontFamily: 'Roboto'),)),
                              ], rows:[
                            DataRow(
                                color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states) {
                                  return Color(0xff9993F3).withOpacity(0.7);
                                }),
                                cells: [
                                  DataCell(Text("Matem??tica",style:TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto' ),)),
                                  DataCell(Text("15", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("3", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("9,5", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                ]),
                            DataRow(
                                color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states) {
                                  return Color(0xff9993F3).withOpacity(0.7);
                                }),
                                cells: [
                                  DataCell(Text("Portugu??s", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("15", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("5", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("7,5", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                ]),
                            DataRow(
                                color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states) {
                                  return Color(0xff9993F3).withOpacity(0.7);
                                }),
                                cells: [
                                  DataCell(Text("Geografia", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("13", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("2", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("10", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                ]),
                            DataRow(
                                color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states) {
                                  return Color(0xff9993F3).withOpacity(0.7);
                                }),
                                cells: [
                                  DataCell(Text("Hist??ria", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("10", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("0", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("6", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                ]),
                            DataRow(
                                color:MaterialStateProperty.resolveWith<Color>((Set<MaterialState>states) {
                                  return Color(0xff9993F3).withOpacity(0.7);
                                }),
                                cells: [
                                  DataCell(Text("Filosofia", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("8", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("6", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                  DataCell(Text("9", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontFamily: 'Roboto'),)),
                                ]),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top:40),
                    child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          fixedSize: Size(350, 50), primary: Color(0xff4263EB),
                        ),
                        child: Text('Minhas Notas', style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),)),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            );
          }
        ),
      ),

    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;


}



import 'package:aula_sql_lite/telas/tela_Adicionar.dart';
import 'package:aula_sql_lite/telas/tela_MQTT.dart';
import 'package:aula_sql_lite/telas/tela_consulta.dart';
import 'package:aula_sql_lite/widgets/widget_input.dart';
import 'package:flutter/material.dart';

import '../widgets/widget_button.dart';
class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  final _txtsuaId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha a opção 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext ctx) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Buttons("Cadastrar", onPressed:() {_abreTelas(ctx, TelaAdicionar() );}),
          Buttons("Consultar", onPressed: () {_abreTelas(ctx, TelaConsulta() );}),
          Buttons("MQTT", onPressed: () {_abreTelas(ctx, TelaMQTT(_txtsuaId.text) );}),
          InputTextos("Digite sua mensagem", "Informe o nome", controller: _txtsuaId),

        ],
      ),
    );
  }


  _abreTelas(ctx, page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));
  }

}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Principal());
  
}

class Principal extends StatelessWidget{
  //contrução do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Aplicativo com API',
       theme: ThemeData(primarySwatch: Colors.blue),
       home: home(),
       );
  }
}

class home extends StatefulWidget{
  @override 
  home_state createState() => home_state();
}

class home_state extends State<home>{
//permite manipular o texto dentro do campo de input
   TextEditingController controleTexto = TextEditingController();
   String conteudo = '';
   String imagem = '';

   Future<void> buscar() async { 
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';

    final resposta = await http.get(Uri.parse(url)); 

    if (resposta.statusCode == 200){

   
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado['originalimage']['source'];
      });
       }else{
      //se houver um erro
      conteudo = 'Nada foi encontrado!';
      imagem = '';
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo com API'),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxn9vXhhs-NJJbcbiYhLxFjLdxuFrdH_QsCQ&usqp=CAU'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2 - construção do card
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Center(
            child: Card(
              color: Colors.white,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                      Expanded(
                      child:TextField(
                      controller: controleTexto,
                      decoration: const InputDecoration(
                        labelText: 'Digite o texto',
                      ),
                    ),
                  ),
                     ElevatedButton(
                      onPressed: buscar, 
                      child: Icon(Icons.search, color:Colors.white, fill: ),
                      ),
                     ],
                    ),
                      const SizedBox(height: 20.0),
                      const Text(
                      'Resultado:',
                      style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(conteudo, style: TextStyle(fontSize: 16.0)),
                    const SizedBox(height: 20),
                    if(imagem.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) =>
                            ImagemTelaInteira(imagemParametro: imagem),
                             ),
                           );
                         },
                       ),
                    Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(imagem, height: 200),
                     ),
                    ),
                  ],
                ),
              ),
             ),
            ),
          ),
        ],
      ),
    );
  }
}


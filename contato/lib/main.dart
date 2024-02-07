import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget{
  //necessario para  inicializar a widget, passa para a classe pai
  const Contato({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  //passa parâmetros informações para dentro dessa classe
 const Principal({super.key, required this.title});
 final String title;

 //cria um estado que vai se referir a clase_PrincipalEstado
 @override
 State<Principal> createState() => _PrincipalEstado();
}
//classe _PrincipalEstado herdando o Estado - Estado: vai ficar atualizando
class _PrincipalEstado extends State<Principal> {

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkeb2ZKC-slt5wm_MwRauN6xsw9lbxHCgB3g&usqp=CAU"),
    radius: 150,
  );

  final nome = const Text(
    'Talia Pisciteli',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final obs = const Text(
    'Futura Design ',
    style: TextStyle(fontSize: 20, color: Colors.blue),
    textAlign: TextAlign.center,
  );

  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
        scheme: 'mailto', 
        path: '',
        queryParameters: {
        'subject': 'Assunto do email',
        'body': 'Corpo do Email',
        },
      ));
    },
  );

  final telefone = IconButton( 
  icon: const Icon(Icons.phone),
  color: Colors.blue,
  onPressed: () {
    launchUrl(Uri(scheme: 'tel', path: '+5544007750727'));
  },
  );

final sms = IconButton( 
   color: Colors.blue,
  icon: const Icon(Icons.phone),
  onPressed: () {
    launchUrl(Uri(scheme: 'sms', path: '+5544997750727'));
  },
  );

  final site = IconButton( 
   color: Colors.blue,
  icon: const Icon(Icons.open_in_browser),
  onPressed: () {
    launchUrl(Uri.parse(
      'https://www.linkedin.com/feed/?trk=guest_homepage-basic_google-one-tap-submit'));
      
  },
  );


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicativo de Contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {},
        ),
      ),
      //organizar em coluna
      body: Column(
        //alinhar conteudo no centro - acima/abaixo
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,nome, obs,
          Text('Olá Mundo'),
          //criando linha
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email, 
              telefone,
              sms,
            ],
            //botões do aplicativo 
          ),
        ],
      ),
    );
  }
}

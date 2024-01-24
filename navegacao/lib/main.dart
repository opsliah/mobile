import 'package:flutter/material.dart';

//método principal que inicia a aplicação
void main(){
   runApp(Aplicativo());          //runApp - roda app Chama classe Aplicativo 
}

//A classe aplicativo vai herdar Stateless - não tem alteração dentro da tela
class Aplicativo extends StatelessWidget{

 //Widget build vai construir a aplicação 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(              //oferece padrão de design e componentes 
      debugShowCheckedModeBanner: false,            
      home: Pagina1(),               // home - representa tela inicial - a primeira que abre 
    );
  }
}

class Pagina1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 //fornece estruturas básicas 
 return Scaffold(
  //barra de cima 
  appBar: AppBar(
    //texto dentro da barra - cor da letra
    title: const Text('Página 1', style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.blue,  //cor da barra 
      ),
         //body- corpo - Center - Centralizar(direta-esquerda)
      body: Center(      
             //organize em sentido coluna      
         child: Column(  
           //centraliza sentido (acima-abaixo)
          mainAxisAlignment: MainAxisAlignment.center,         
         children: [
          Image.network(
            'https://miro.medium.com/v2/resize:fit:1358/1*6JxdGU2WIzHSUEGBx4QeAQ.jpeg',
             width: 300, 
             height: 300,
          ),
          const Text(
             'Bem vindo a tela Inicial',
             style: TextStyle(fontSize: 30),

          ),
          
           const Text(
            'Flutter é a ferramenta multiplataforma - Android e IOS com um único código'
            ),

            const SizedBox(height: 20), //dar uma quebra de linha <br> 

            ElevatedButton(
              onPressed: ()  {
                //Navigator, gerencia navegações entre telas
                //push - empurra uma nova rota, para a pilha de navegação
                Navigator.push(
                //context indentifica pagina atual 
                  context, 
                //MaterialPageRouter - define animação e layout para ir para outra tela
                //builder - Constroi a nova tela Pagina2
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              },
              child: Text(
                'Ir para Página 2'
                ),
            ),
          ],
         ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página 2', style: TextStyle(color: Colors.white),), 
      backgroundColor: Color.fromARGB(255, 86, 9, 94),
      ),

      //ignore: prefer_const_constructors
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Image.network('https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg', width: 300, height: 300,
          ),
          SizedBox(height: 20),
          Text(
            'Linguagem DART',
            style: TextStyle(fontSize: 30),
            ),
          Text(
            'É uma linguagem versátil que bombina eficienca e desempenho'
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pagina3()),
                );
              },
             child: Text('Ir para página 3'),
            ),
          ],
        ),
      ),
    );
  }
}

//Stateless - informações estatícas não mudam
class Pagina3 extends StatelessWidget {
  //build - responsavel pela redenteriazação/construção
  @override
  Widget build(BuildContext context) {
    //define estruturas de layout - appbar = body
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 199, 95, 9),
        actions:[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                child: Text('Opção 1'),
                value: 'opcao1', 
              ),
               PopupMenuItem(
              child: Text('Opção 2'),
              value: 'opcao2', 
                ),
              ];
            },
            onSelected: (value){}, //ação ao selecionar opção
          ),
        ]
      ),
      //corpo do aplicativo - Centralizando esquerda/direita
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centralizando acima-baixo
          children: [
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Senac_logo.svg/2560px-Senac_logo.svg.png',
            width: 300,
            height: 300,
            ),
            Text(
              'A História do Senac',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'O Senac foi criado no ano 1946, com o propósito de educar profissionalmente'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pagina1()),
                  );
                },
                child:Text('Voltar para Página Inicial'),
              ),
           ],
        ),
      )
    );
  }
}


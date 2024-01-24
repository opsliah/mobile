import 'package:flutter/material.dart';

//onde a execução do programa começa - principal
 
 void main(){
  runApp (const Aplicativo()); //roda aplicativo
 }

//classe aplicativo (contém caracteristicas, variaveis e funções)
//extends - extende - Herda caracteristicas do widget stateless
//stateless - toda interface é imutavel após a criação
class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});
 
  
  //build - método que recontroi tela
   @override
  Widget build(BuildContext context) {
   
   //widget responsavel pelo design da aplicação, fornece temas e recursos 
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    //home - tela principal- Scaffold fornece layout basico
    home : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter é divertido!',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),

      //body é o corpo do app, Center vai centralizar o conteúdo
      body: const Center(
      // chil representa que é filho do widget Center -SizedBox - CaixaCom Tamanho 
      child: SizedBox(
        //ignore: unnecessary_const, short_child_properties_last
        child: const Text(
          'Flutter foi criado pelo Google, usa a linguagem DART',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'arial',
        ),
        ),
        height: 300,       //altura da caixa 
        width: 300,        //largura da caixa
          ),
        ),

        //botão flutuante no canto direito abaixo
        floatingActionButton:
         FloatingActionButton(
          backgroundColor: Colors.blue,      //alterar cor botão 
           child: Icon(Icons.add),             //icone do botão
          onPressed:() {},                     //ação quando clicar
         ),

         // --------barra de navegação inferior 
         //BottomNavigationBarItem - é o item da barra de navegação 
         bottomNavigationBar: BottomNavigationBar(items  : const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Negócios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
         ]),

         // -----barra lateral do aplicativo
         drawer: Drawer(
          backgroundColor: Colors.white,

          //lista dos itens do menu
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color:Colors.blue),
                child: Text(
                  'Menu App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  )
                )
              ),

              ListTile(                                    //icone do item do menu
                leading: const Icon(Icons.home),           //titulo do item do menu
                title: Text('Pagina Inicial'),             //ação que o botão irá executar
                onTap:() {},
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap:() {},
              ),

              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Perfil'),
                onTap:() {},
              ),


            ],
          ),
         ),
      ),
    );
  
  }
}


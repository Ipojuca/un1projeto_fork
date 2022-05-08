import 'package:flutter/material.dart';
import 'package:un1projeto/data/my_data.dart';
import 'package:un1projeto/models/projeto.dart';
import 'package:un1projeto/models/usuario.dart';

import '../utils/app_routes.dart';
import 'favoritos_screen.dart';
import 'projetos_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // _novoProjeto(Projeto projeto) {
  //   setState(() {
  //     _projetos.add(projeto);
  //   });
  // }

  int _indexSelectedScreen = 0;

  // List<Widget> _screens = [
  //   ProjetosScreen(),
  //   ,
  //   FavoritosScreen()
  // ];

  _selectScreen(int index) async {
    switch (index) {
      case 0:
        ProjetosScreen();
        break;
        /*var result =
            await Navigator.pushNamed(context, AppRoutes.PROJETO_LISTA,
                  arguments: _usuarios);
        break;*/

      case 1:
        var result =
            await Navigator.pushNamed(context, AppRoutes.PROJETO_CADASTRO);
        _projetos.add(result as Projeto);
        break;
      case 2:
        var result =
            await Navigator.pushNamed(context, AppRoutes.USUARIO_CADASTRO);
        _usuarios.add(result as Usuario);
        break;
      default:
    }
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  List<Projeto> _projetos = DUMMY_PROJETOS;
  List<Usuario> _usuarios = []/*DUMMY_USUARIOS*/;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciador de Projetos')),
      body: ProjetosScreen(), // _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Projetos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: 'Cadastrar Projeto'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Cadastrar Usuario'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
} //Fin de clase myapp

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(brightness: Brightness.dark), debugShowCheckedModeBanner: false, home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  TabController controller;
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }

  Widget card(String text) {
    return Card(
      color: Colors.black,
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30))),
      ),
    );
  }

  Tab tab(String text, Icon icon) {
    return Tab(
      icon: icon,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_-- TabBars Lopez --_"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          card("Inicio"),
          card("Fotos"),
          card("Favoritos"),
          card("Perfil"),
          card("Opciones"),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        isScrollable: true,
        tabs: <Widget>[
          tab("Inicio", Icon(Icons.home, color: Colors.yellow)),
          tab("Foto", Icon(Icons.add_a_photo, color: Colors.yellow)),
          tab("Favoritos", Icon(Icons.bookmark_rounded, color: Colors.yellow)),
          tab("Perfil", Icon(Icons.account_circle, color: Colors.yellow)),
          tab("Opciones", Icon(Icons.settings_rounded, color: Colors.yellow)),
        ],
      ),
    );
  }
}

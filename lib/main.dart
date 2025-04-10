import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  ThemeMode _modoTema = ThemeMode.system;

  void _alternarTema() {
    setState(() {
      if (_modoTema == ThemeMode.system) {
        final temaEscuro = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
        _modoTema = temaEscuro ? ThemeMode.light : ThemeMode.dark;
      } else if (_modoTema == ThemeMode.light) {
        _modoTema = ThemeMode.dark;
      } else {
        _modoTema = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 72, 33, 243),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
          bodySmall: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 113, 45, 240),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
          bodySmall: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      themeMode: _modoTema,
      home: PaginaInicial(alternarTema: _alternarTema, modoTema: _modoTema),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({
    super.key,
    required this.alternarTema,
    required this.modoTema,
  });

  final VoidCallback alternarTema;
  final ThemeMode modoTema;

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int _indiceSelecionado = 0;
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _itemSelecionado(int indice) {
    setState(() {
      _indiceSelecionado = indice;
    });
  }

  IconData _obterIconeTema(BuildContext context) {
    if (widget.modoTema == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? MdiIcons.brightnessAuto
          : MdiIcons.brightnessAuto;
    }
    return widget.modoTema == ThemeMode.dark
        ? MdiIcons.weatherSunny
        : MdiIcons.weatherNight;
  }

  String _obterDicaTema(BuildContext context) {
    if (widget.modoTema == ThemeMode.system) {
      return 'Usando tema do sistema';
    }
    return widget.modoTema == ThemeMode.dark
        ? 'Mudar para tema claro'
        : 'Mudar para tema escuro';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Aplicativo',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(MdiIcons.magnify), onPressed: () {}),
          IconButton(
            icon: Icon(_obterIconeTema(context)),
            onPressed: widget.alternarTema,
            tooltip: _obterDicaTema(context),
          ),
          IconButton(icon: Icon(MdiIcons.dotsVertical), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Usuário',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                'usuario@exemplo.com',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(MdiIcons.account),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(MdiIcons.home),
              title: const Text(
                'Início',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
              selected: _indiceSelecionado == 0,
              onTap: () {
                _itemSelecionado(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.briefcase),
              title: const Text(
                'Trabalho',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
              selected: _indiceSelecionado == 1,
              onTap: () {
                _itemSelecionado(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.school),
              title: const Text(
                'Estudo',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
              selected: _indiceSelecionado == 2,
              onTap: () {
                _itemSelecionado(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(MdiIcons.cog),
              title: const Text(
                'Configurações',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 200,
                height: 200,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    'assets/images/flutter_logo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Você pressionou o botão estas vezes:',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            if (_indiceSelecionado == 0)
              const Text(
                'Conteúdo da Página Inicial',
                style: TextStyle(fontFamily: 'Roboto'),
              )
            else if (_indiceSelecionado == 1)
              const Text(
                'Conteúdo da Página de Trabalho',
                style: TextStyle(fontFamily: 'Roboto'),
              )
            else
              const Text(
                'Conteúdo da Página de Estudo',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarContador,
        tooltip: 'Incrementar',
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(MdiIcons.plus),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MdiIcons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.briefcase),
            label: 'Trabalho',
          ),
          BottomNavigationBarItem(icon: Icon(MdiIcons.school), label: 'Estudo'),
        ],
        currentIndex: _indiceSelecionado,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _itemSelecionado,
      ),
    );
  }
}

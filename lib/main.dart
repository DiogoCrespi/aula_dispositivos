import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o binding do Flutter está inicializado
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        // Se estiver usando o tema do sistema, muda para o oposto do tema atual do sistema
        final isPlatformDark =
            MediaQuery.platformBrightnessOf(context) == Brightness.dark;
        _themeMode = isPlatformDark ? ThemeMode.light : ThemeMode.dark;
      } else if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 72, 33, 243),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 113, 45, 240),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: MyHomePage(onThemeToggle: _toggleTheme, themeMode: _themeMode),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.onThemeToggle,
    required this.themeMode,
  });

  final VoidCallback onThemeToggle;
  final ThemeMode themeMode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  IconData _getThemeIcon(BuildContext context) {
    if (widget.themeMode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? MdiIcons.brightnessAuto
          : MdiIcons.brightnessAuto;
    }
    return widget.themeMode == ThemeMode.dark
        ? MdiIcons.weatherSunny
        : MdiIcons.weatherNight;
  }

  String _getThemeTooltip(BuildContext context) {
    if (widget.themeMode == ThemeMode.system) {
      return 'Usando tema do sistema';
    }
    return widget.themeMode == ThemeMode.dark
        ? 'Mudar para tema claro'
        : 'Mudar para tema escuro';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo App'),
        actions: [
          IconButton(icon: Icon(MdiIcons.magnify), onPressed: () {}),
          IconButton(
            icon: Icon(_getThemeIcon(context)),
            onPressed: widget.onThemeToggle,
            tooltip: _getThemeTooltip(context),
          ),
          IconButton(icon: Icon(MdiIcons.dotsVertical), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('John Doe'),
              accountEmail: const Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(MdiIcons.account),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(MdiIcons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.briefcase),
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.school),
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(MdiIcons.cog),
              title: const Text('Settings'),
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
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            if (_selectedIndex == 0)
              const Text('Home Page Content')
            else if (_selectedIndex == 1)
              const Text('Business Page Content')
            else
              const Text('School Page Content'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(MdiIcons.plus),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MdiIcons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.briefcase),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(MdiIcons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import 'providers/cart_provider.dart';

/// Ponto de entrada do aplicativo
void main() async {
  // Garante que os bindings do Flutter estejam inicializados
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carrega as preferências do usuário
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool(Constants.themeModeKey) ?? false;
  
  // Inicia o aplicativo
  runApp(MyApp(isDarkMode: isDarkMode));
}

/// Widget raiz do aplicativo
class MyApp extends StatefulWidget {
  /// Estado inicial do tema
  final bool isDarkMode;

  const MyApp({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  /// Alterna entre os temas claro e escuro
  Future<void> _toggleTheme() async {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    
    // Persiste a preferência do usuário
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.themeModeKey, _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: Constants.appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(onThemeToggle: _toggleTheme),
      ),
    );
  }
}

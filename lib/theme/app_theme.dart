import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Classe responsável por definir os temas da aplicação.
/// Fornece temas claro e escuro com cores e estilos consistentes.
class AppTheme {
  /// Cores primárias do tema
  static const _primaryLight = Color(0xFF6200EE);
  static const _primaryDark = Color(0xFFBB86FC);
  
  /// Cores secundárias do tema
  static const _secondaryLight = Color(0xFF03DAC6);
  static const _secondaryDark = Color(0xFF03DAC6);
  
  /// Cores de erro
  static const _errorLight = Color(0xFFB00020);
  static const _errorDark = Color(0xFFCF6679);

  /// Tema claro da aplicação
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      secondary: _secondaryLight,
      error: _errorLight,
      // Cores de superfície
      surface: Colors.white,
      surfaceVariant: _primaryLight.withOpacity(0.05),
      // Cores de texto
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      onBackground: Colors.black87,
    ),
    // Tipografia
    textTheme: GoogleFonts.robotoTextTheme(),
    // Elevação e sombras
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    // Cards e superfícies
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // Appbar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: _primaryLight,
    ),
  );

  /// Tema escuro da aplicação
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      secondary: _secondaryDark,
      error: _errorDark,
      // Cores de superfície
      surface: const Color(0xFF121212),
      surfaceVariant: _primaryDark.withOpacity(0.08),
      // Cores de texto
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
    // Tipografia
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    // Elevação e sombras
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    // Cards e superfícies
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // Appbar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: _primaryDark,
    ),
  );
} 
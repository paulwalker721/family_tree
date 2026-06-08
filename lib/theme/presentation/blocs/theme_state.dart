// presentation/bloc/theme_state.dart
part of 'theme_bloc.dart';

class ThemeState {
  final AppThemeMode mode;
  final ThemeData themeData;

  ThemeState({
    required this.mode,
    required this.themeData,
  });
}

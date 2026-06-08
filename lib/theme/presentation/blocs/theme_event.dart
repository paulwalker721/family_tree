
// presentation/bloc/theme_event.dart

part of "theme_bloc.dart";

sealed class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final AppThemeMode mode;
  ChangeTheme(this.mode);
}

// domain/usecases/set_theme_mode.dart
import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class SetThemeMode {
  final ThemeRepository repository;
  SetThemeMode(this.repository);

  Future<void> call(AppThemeMode themeMode) => repository.saveTheme(themeMode);
}

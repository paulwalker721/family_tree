// domain/repositories/theme_repository.dart
import '../entities/app_theme_mode.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getSavedTheme();
  Future<void> saveTheme(AppThemeMode themeMode);
}

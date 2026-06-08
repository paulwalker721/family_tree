// domain/usecases/get_theme_mode.dart
import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class GetThemeMode {
  final ThemeRepository repository;
  GetThemeMode(this.repository);

  Future<AppThemeMode> call() => repository.getSavedTheme();
}

// data/data_sources/theme_local_datasource.dart

import '../../../../core/services/storage_service.dart';
import '../../../core/utils/log.dart';
import '../../domain/entities/app_theme_mode.dart';

class ThemeLocalDataSource {
  final StorageService pref;

  ThemeLocalDataSource(this.pref);

  Future<AppThemeMode> getTheme() async {
    final raw = pref.getThemeMode ?? AppThemeMode.system.name;
    log(name: "THEME", raw.toString());
    if (raw == AppThemeMode.dark.name) {
      return AppThemeMode.dark;
    } else if (raw == AppThemeMode.light.name) {
      return AppThemeMode.light;
    } else {
      return AppThemeMode.system;
    }
  }

  Future<void> saveTheme(AppThemeMode mode) async {
    log(name: "SET THEME", mode.toString());
    await pref.setThemeMode(mode.name);
  }
}

// // data/repositories/theme_repository_impl.dart

// import '../../domain/entities/app_theme_mode.dart';
// import '../../domain/repositories/theme_repository.dart';
// import '../data_sources/theme_local_datasource.dart';

// class ThemeRepositoryImpl implements ThemeRepository {
//   final ThemeLocalDataSource local;

//   ThemeRepositoryImpl(this.local);

//   @override
//   Future<AppThemeMode> getSavedTheme() => local.getTheme();

//   @override
//   Future<void> saveTheme(AppThemeMode themeMode) => local.saveTheme(themeMode);
// }

import "package:bloc/bloc.dart";
import "package:flutter/material.dart";

import "../../domain/entities/app_theme_mode.dart";
import "../../domain/use_cases/get_theme_mode.dart";
import "../../domain/use_cases/set_theme_mode.dart";

part "theme_event.dart";
part "theme_state.dart";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeMode getThemeMode;
  final SetThemeMode setThemeMode;

  ThemeBloc(this.getThemeMode, this.setThemeMode)
    : super(ThemeState(mode: AppThemeMode.light, themeData: ThemeData.light())) {
    on<LoadTheme>(_onLoad);
    on<ToggleTheme>(_onToggle);
    on<ChangeTheme>(_onChangeTheme);
  }

  Future<void> _onLoad(LoadTheme event, Emitter<ThemeState> emit) async {
    final mode = await getThemeMode();
    emit(_buildState(mode));
  }

  Future<void> _onToggle(ToggleTheme event, Emitter<ThemeState> emit) async {
    final next = state.mode == AppThemeMode.light
        ? AppThemeMode.dark
        : AppThemeMode.light;
    await setThemeMode(next);
    emit(_buildState(next));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    await setThemeMode(event.mode);
    emit(_buildState(event.mode));
  }

  ThemeState _buildState(AppThemeMode mode) {
    final ThemeData themeData;
    if (mode == AppThemeMode.dark) {
      themeData = ThemeData.dark();
    } else if (mode == AppThemeMode.light) {
      themeData = ThemeData.light();
    } else {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      themeData = brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
    }
    return ThemeState(
      mode: mode,
      themeData: themeData,
    );
  }
}

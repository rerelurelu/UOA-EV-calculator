import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

/// テーマ選択のProvider
final themeSelectorProvider = StateNotifierProvider(
  (ref) => ThemeSelector(ref.read),
);

/// テーマの変更・記憶を行うStateNotifier
class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._reader) : super(ThemeMode.system) {
    initialize();
  }
  /// SharedPreferences で使用するテーマ記憶用のキー
  static const themePrefsKey = 'selectedTheme';

  // 現状、他のProviderを読み込むことは無いので削除しても良い
  // ignore: unused_field
  final Reader _reader;

  /// 選択されたテーマの記憶があれば取得して反映
  Future initialize() async {
    final themeIndex = await _themeIndex;
    state = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  /// テーマの変更を行い、永続化
  Future change(ThemeMode theme) async {
    await _save(theme.index);
    state = theme;
  }

  /// 現在選択中のテーマを`SharedPreferences`から取得
  Future<int> get _themeIndex async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themePrefsKey);
  }

  /// 選択した`SharedPreferences`に保存
  Future<void> _save(int themeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themePrefsKey, themeIndex);
  }
}

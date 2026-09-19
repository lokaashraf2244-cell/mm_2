import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/core/cubit/theme/theme_state.dart';
class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeState(isDark: false));
  void switchtheme() {
    emit(ThemeState(isDark: !state.isDark));
  }
}
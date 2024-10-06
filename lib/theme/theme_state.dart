part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState(this.isDark);

  final bool isDark;

  @override
  List<Object> get props => [isDark];
}

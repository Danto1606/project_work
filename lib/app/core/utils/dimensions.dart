// ignore_for_file: non_constant_identifier_names
import 'package:project_work/index.dart';

class Dimensions {
  static double screen_width = Get.mediaQuery.size.shortestSide;
  static double screen_height = Get.mediaQuery.size.longestSide;

  static final padding = screen_width * 15 / 360;

  static double height(double h) => (h / 809) * screen_height;
  static double width(double b) => (b / 360) * screen_width;
  static double font(double f) =>
      f * (screen_width * screen_height) / (809 * 360);
}

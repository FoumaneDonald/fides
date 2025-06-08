import 'package:flutter/material.dart';

import 'iconSets/icon_sets.dart';

class AppIcon{
  static final IconSet _iconSet = HugeIconsSet();

  static Widget home({IconData? icon, Color? color, double? size}) => _iconSet.home(icon: icon, color: color, size: size);
  static Widget program({IconData? icon, Color? color, double? size}) => _iconSet.program(icon: icon, color: color, size: size);
  static Widget stamp({IconData? icon, Color? color, double? size}) => _iconSet.stamp(icon: icon, color: color, size: size);
  static Widget points({IconData? icon, Color? color, double? size}) => _iconSet.points(icon: icon, color: color, size: size);
  static Widget menu({IconData? icon, Color? color, double? size}) => _iconSet.menu(icon: icon, color: color, size: size);
  static Widget add({IconData? icon, Color? color, double? size}) => _iconSet.add(icon: icon, color: color, size: size);
  static Widget addUser({IconData? icon, Color? color, double? size}) => _iconSet.addUser(icon: icon, color: color, size: size);
  static Widget arrowLeft({IconData? icon, Color? color, double? size}) => _iconSet.arrowLeft(icon: icon, color: color, size: size);
  static Widget reward({IconData? icon, Color? color, double? size}) => _iconSet.reward(icon: icon, color: color, size: size);
}
import 'package:flutter/material.dart';

import 'iconSets/icon_sets.dart';

class AppIcon{
  static final IconSet _iconSet = HugeIconsSet();

  static Widget home({Color? color, double size = 24}) => _iconSet.home(color: color, size: size);
  static Widget program({Color? color, double size = 24}) => _iconSet.program(color: color, size: size);
  static Widget stamp({Color? color, double size = 24}) => _iconSet.stamp(color: color, size: size);
  static Widget points({Color? color, double size = 24}) => _iconSet.points(color: color, size: size);
  static Widget menu({Color? color, double size = 24}) => _iconSet.menu(color: color, size: size);
  static Widget add({Color? color, double size = 24}) => _iconSet.add(color: color, size: size);
  static Widget addCircle({Color? color, double size = 24}) => _iconSet.add(color: color, size: size);
  static Widget addUser({Color? color, double size = 24}) => _iconSet.addUser(color: color, size: size);
  static Widget arrowLeft({Color? color, double size = 24}) => _iconSet.arrowLeft(color: color, size: size);
  static Widget reward({Color? color, double size = 24}) => _iconSet.reward(color: color, size: size);
  static Widget star({Color? color, double size = 24}) => _iconSet.star(color: color, size: size);
  static Widget arrowRight({Color? color, double size = 24}) => _iconSet.arrowRight(color: color, size: size);
  static Widget questionCircle({Color? color, double size = 24}) => _iconSet.questionCircle(color: color, size: size);
  static Widget gift({Color? color, double size = 24}) => _iconSet.gift(color: color, size: size);
  static Widget remove({Color? color, double size = 24}) => _iconSet.remove(color: color, size: size);
  static Widget calendar({Color? color, double size = 24}) => _iconSet.calendar(color: color, size: size);
  static Widget trash({Color? color, double size = 24}) => _iconSet.trash(color: color, size: size);
  static Widget addImage({Color? color, double size = 24}) => _iconSet.addImage(color: color, size: size);
  static Widget cancel({Color? color, double size = 24}) => _iconSet.cancel(color: color, size: size);
}
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../config/theme/app_theme.dart';

abstract class IconSet {
  Widget home({IconData? icon, Color? color, double? size});
  Widget program({IconData? icon, Color? color, double? size});
  Widget stamp({IconData? icon, Color? color, double? size});
  Widget points({IconData? icon, Color? color, double? size});
  Widget menu({IconData? icon, Color? color, double? size});
  Widget add({IconData? icon, Color? color, double? size});
  Widget addUser({IconData? icon, Color? color, double? size});
  Widget arrowLeft({IconData? icon, Color? color, double? size});
  Widget reward({IconData? icon, Color? color, double? size});
}

class MaterialIconSet extends IconSet {
  @override
  Widget home({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.home, size: size,);

  @override
  Widget program({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.credit_card_rounded, size: size,);

  @override
  Widget stamp({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.circle_outlined, size: size,);

  @override
  Widget points({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.token, size: size,);

  @override
  Widget menu({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.menu, size: size,);

  @override
  Widget add({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.add_circle, size: size,);

  @override
  Widget addUser({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.add_reaction_rounded, size: size,);

  @override
  Widget arrowLeft({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.arrow_back_ios, size: size,);

  @override
  Widget reward({IconData? icon, Color? color, double? size}) => Icon(icon ?? Icons.card_giftcard, size: size,);
}

class HugeIconsSet extends IconSet {
  @override
  Widget home({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedHome01, color: color!, size: size ?? 24.0,);

  @override
  Widget program({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedLoyaltyCard, color: color!, size: size ?? 24.0,);

  @override
  Widget stamp({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedStamp01, color: color!, size: size ?? 24.0,);

  @override
  Widget points({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedTokenCircle, color: color!, size: size ?? 24.0,);

  @override
  Widget menu({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedMenuTwoLine, color: color!, size: size ?? 24.0,);

  @override
  Widget add({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedAddCircle, color: color!, size: size ?? 24.0,);

  @override
  Widget addUser({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedUserAdd01, color: color!, size: size ?? 24.0,);

  @override
  Widget arrowLeft({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedArrowLeft02, color: color!, size: size ?? 24.0,);

  @override
  Widget reward({IconData? icon, Color? color, double? size}) => HugeIcon(icon: icon ?? HugeIcons.strokeRoundedGift, color: color!, size: size ?? 24.0,);
}

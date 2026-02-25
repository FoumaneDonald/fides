import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../config/theme/app_theme.dart';

abstract class IconSet {
  Widget home({Color? color, double size = 18});
  Widget program({Color? color, double size = 18});
  Widget stamp({Color? color, double size = 18});
  Widget points({Color? color, double size = 18});
  Widget menu({Color? color, double size = 18});
  Widget addCircle({Color? color, double size = 18});
  Widget add({Color? color, double size = 18});
  Widget addUser({Color? color, double size = 18});
  Widget arrowLeft({Color? color, double size = 18});
  Widget reward({Color? color, double size = 18});
  Widget star({Color? color, double size = 18});
  Widget arrowRight({Color? color, double size = 18});
  Widget questionCircle({Color? color, double size = 18});
  Widget gift({Color? color, double size = 18});
  Widget remove({Color? color, double size = 18});
  Widget calendar({Color? color, double size = 18});
  Widget trash({Color? color, double size = 18});
  Widget addImage({Color? color, double size = 18});
  Widget cancel({Color? color, double size = 18});
  Widget circle({Color? color, double size = 18});
}

// class MaterialIconSet extends IconSet {
//   @override
//   Widget home({Color? color, double size = 18}) => Icon(Icons.home, size: size);
//
//   @override
//   Widget program({Color? color, double size = 18}) => Icon(Icons.credit_card_rounded, size: size);
//
//   @override
//   Widget stamp({Color? color, double size = 18}) => Icon(Icons.circle_outlined, size: size);
//
//   @override
//   Widget points({Color? color, double size = 18}) => Icon(Icons.token, size: size);
//
//   @override
//   Widget menu({Color? color, double size = 18}) => Icon(Icons.menu, size: size);
//
//   @override
//   Widget add({Color? color, double size = 18}) => Icon(Icons.add, size: size);
//
//   @override
//   Widget addCircle({Color? color, double size = 18}) => Icon(Icons.add_circle_outline_rounded, size: size);
//
//   @override
//   Widget addUser({Color? color, double size = 18}) => Icon(Icons.add_reaction_rounded, size: size);
//
//   @override
//   Widget arrowLeft({Color? color, double size = 18}) => Icon(Icons.arrow_back_ios, size: size);
//
//   @override
//   Widget reward({Color? color, double size = 18}) => Icon(Icons.card_giftcard, size: size);
//
//   @override
//   Widget star({Color? color, double size = 18}) => Icon(Icons.star_outline_outlined, size: size);
//
//   @override
//   Widget arrowRight({Color? color, double size = 18}) => Icon(Icons.arrow_right_alt_rounded, size: size);
//
//   @override
//   Widget questionCircle({Color? color, double size = 18}) => Icon(Icons.help_outline_rounded, size: size);
//
//   @override
//   Widget gift({Color? color, double size = 18}) => Icon(Icons.card_giftcard_rounded, size: size);
//
//   @override
//   Widget remove({Color? color, double size = 18}) => Icon(Icons.remove, size: size);
//
//   @override
//   Widget calendar({Color? color, double size = 18}) => Icon(Icons.calendar_month_rounded, size: size);
//
//   @override
//   Widget trash({Color? color, double size = 18}) => Icon(Icons.delete_outline_rounded, size: size);
//
//   @override
//   Widget addImage({Color? color, double size = 18}) => Icon(Icons.delete_outline_rounded, size: size);
// }

class HugeIconsSet extends IconSet {
  @override
  Widget home({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: size, color: color);

  @override
  Widget program({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedLoyaltyCard, size: size, color: color);

  @override
  Widget stamp({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedStamp01, size: size, color: color);

  @override
  Widget points({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedTokenCircle, size: size, color: color);

  @override
  Widget menu({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedMenuTwoLine, size: size, color: color);

  @override
  Widget add({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedPlusSign, size: size, color: color);

  @override
  Widget addCircle({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedAddCircle, size: size, color: color);

  @override
  Widget addUser({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedUserAdd01, size: size, color: color);

  @override
  Widget arrowLeft({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02, size: size, color: color);

  @override
  Widget reward({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedGift, size: size, color: color);

  @override
  Widget star({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedStarCircle, size: size, color: color);

  @override
  Widget arrowRight({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedArrowRight02, size: size);

  @override
  Widget questionCircle({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, size: size, color: color);

  @override
  Widget gift({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedGiftCard02, size: size, color: color);

  @override
  Widget remove({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedRemove01, size: size, color: color);

  @override
  Widget calendar({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedCalendar01, size: size, color: color);

  @override
  Widget trash({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedDelete01, size: size, color: color);

  @override
  Widget addImage({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedImageAdd02, size: size, color: color);

  @override
  Widget cancel({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedCancel01, size: size, color: color);

  @override
  Widget circle({Color? color, double size = 18}) => HugeIcon(icon: HugeIcons.strokeRoundedCircle, size: size, color: color);
}

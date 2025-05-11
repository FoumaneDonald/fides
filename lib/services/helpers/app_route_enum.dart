enum AppRoute {
  home,
  programs,
  selectLoyaltyProgram,
  stampCardProgram,
  aboutProgram,
  programReward,
  subscribeCustomer;

  String get name => toString().split('.').last;

  String get path {
    switch (this) {
      case AppRoute.home:
        return '/home';
      case AppRoute.programs:
        return '/programs';
      case AppRoute.selectLoyaltyProgram:
        return 'select-loyalty-program';
      case AppRoute.stampCardProgram:
        return 'stamp-card-program';
      case AppRoute.aboutProgram:
        return 'points-program';
      case AppRoute.programReward:
        return '/program-reward';
      case AppRoute.subscribeCustomer:
        return '/subscribe_customer';
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

mixin NavigationManager on GetxController {
  var _navigateTo = Rx<NavigationState?>(null);
  Stream<NavigationState?> get navigateToStream => _navigateTo.stream;
  set navigateTo(NavigationState value) => _navigateTo.subject.add(value);
}

class NavigationState extends Equatable {
  final String route;
  final Function(dynamic value)? onPop;
  final bool clear;

  NavigationState({
    required this.route,
    this.onPop,
    this.clear = false,
  });

  List<Object> get props => [route];
}

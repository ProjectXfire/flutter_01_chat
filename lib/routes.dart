import 'package:flutter/material.dart';
// Models
import 'package:flutter_02_chat/modules/shared/models/_models.dart';
// Routes
import 'package:flutter_02_chat/modules/auth/routes.dart';
import 'package:flutter_02_chat/modules/chat/routes.dart';
import 'package:flutter_02_chat/modules/shared/screens/_screens.dart';

class AppRoutes {
  static final appRoutes = <AppRoute>[
    ...AuthRoutes.routes,
    ...ChatRoutes.routes,
    AppRoute(nameRoute: "loading", screen: const LoadingScreen())
  ];

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (var route in appRoutes) {
      routes.addAll({route.nameRoute: (ctx) => route.screen});
    }
    return routes;
  }
}

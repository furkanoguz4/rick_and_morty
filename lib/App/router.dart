import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/views/Locations_view/locations_view.dart';
import 'package:rick_and_morty/views/Sections_view/sections_view.dart';
import 'package:rick_and_morty/views/app_view.dart';
import 'package:rick_and_morty/views/characters_view/characters_view.dart';
import 'package:rick_and_morty/views/characters_view/characters_viewmodel.dart';
import 'package:rick_and_morty/views/favourites_view/favourites_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String characters = "/";
  static const String favourites = "/favourites";
  static const String locations = "/locaitons";
  static const String sections = "/sections";
}

final router = GoRouter(
    navigatorKey: _routerKey,
    initialLocation: AppRoutes.characters,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              AppView(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.characters,
                  builder: (context, state) => ChangeNotifierProvider(
                        create: (context) => CharactersViewModal(),
                        child: const CharactersView(), //bu kod bloğu charactersview sayfası açılınca birbirlerinden haberdar olmaları için yapıldı (viewmodal ile)
                      ))
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.favourites,
                  builder: (context, state) => const FavoruitesView())
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.locations,
                  builder: (context, state) => const LocationsView())
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.sections,
                  builder: (context, state) => const SectionsView())
            ]),
          ]),
    ]);

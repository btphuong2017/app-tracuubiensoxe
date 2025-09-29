import 'package:app_tracuubiensoxe/app/app.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/pages/plates_search_page.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [GoRoute(path: "/", builder: (context, state) => PlatesSearchPage())],
);

import 'package:app_tracuubiensoxe/features/plates/ui/pages/plates_detail_page.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/pages/plates_search_page.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => PlatesSearchPage(),
      routes: [
        GoRoute(
          path: "/plate/:plateNumber",
          builder: (context, state) => PlatesDetailPage(
            plateNumber: state.pathParameters['plateNumber']!,
          ),
        ),
      ],
    ),
  ],
);

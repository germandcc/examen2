import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/add_ticket_screen.dart';
import '../screens/update_ticket_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/add-ticket',
        builder: (context, state) => AddTicketScreen(),
      ),
      GoRoute(
        path: '/ticket/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return UpdateTicketScreen(ticketId: id);
        },
      ),
    ],
  );
}

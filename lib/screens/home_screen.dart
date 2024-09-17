import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    ticketProvider.fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tickets'),
      ),
      body: Consumer<TicketProvider>(
        builder: (context, provider, child) {
          if (provider.tickets.isEmpty) {
            return Center(child: Text('No hay tickets disponibles'));
          }

          return ListView.builder(
            itemCount: provider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = provider.tickets[index];
              return ListTile(
                title: Text(ticket.numeroVuelo),
                subtitle: Text(ticket.aerolinea),
                onTap: () {
                  context.go('/ticket/${ticket.id}');
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add-ticket'),
        child: Icon(Icons.add),
      ),
    );
  }
}

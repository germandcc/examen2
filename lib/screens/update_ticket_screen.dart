import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../models/ticket_model.dart';

class UpdateTicketScreen extends StatefulWidget {
  final String ticketId;

  UpdateTicketScreen({required this.ticketId});

  @override
  _UpdateTicketScreenState createState() => _UpdateTicketScreenState();
}

class _UpdateTicketScreenState extends State<UpdateTicketScreen> {
  final TextEditingController flightNumberController = TextEditingController();
  final TextEditingController airlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    Ticket? ticket = ticketProvider.getTicketById(widget.ticketId);

    if (ticket != null) {
      flightNumberController.text = ticket.numeroVuelo;
      airlineController.text = ticket.aerolinea;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Actualizar Ticket')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: flightNumberController,
              decoration: InputDecoration(labelText: 'Número de Vuelo'),
            ),
            TextField(
              controller: airlineController,
              decoration: InputDecoration(labelText: 'Aerolínea'),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedTicket = Ticket(
                  id: widget.ticketId,
                  numeroVuelo: flightNumberController.text,
                  aerolinea: airlineController.text,
                );
                ticketProvider.updateTicket(updatedTicket);
                Navigator.pop(context);
              },
              child: Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}

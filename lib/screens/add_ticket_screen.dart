import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../models/ticket_model.dart';

class AddTicketScreen extends StatelessWidget {
  final TextEditingController flightNumberController = TextEditingController();
  final TextEditingController airlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Añadir Ticket')),
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
                final newTicket = Ticket(
                  id: '', // Firestore asigna automáticamente el ID
                  numeroVuelo: flightNumberController.text,
                  aerolinea: airlineController.text,
                );
                context.read<TicketProvider>().addTicket(newTicket);
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

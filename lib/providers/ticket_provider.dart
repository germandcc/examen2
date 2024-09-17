import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/ticket_model.dart';

class TicketProvider with ChangeNotifier {
  final CollectionReference _ticketCollection = FirebaseFirestore.instance.collection('TicketAvion');

  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  Future<void> fetchTickets() async {
    var snapshot = await _ticketCollection.get();
    _tickets = snapshot.docs.map((doc) => Ticket.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
    notifyListeners();
  }

  Future<void> addTicket(Ticket ticket) async {
    await _ticketCollection.add(ticket.toMap());
    fetchTickets();
  }

  Future<void> updateTicket(Ticket ticket) async {
    await _ticketCollection.doc(ticket.id).update(ticket.toMap());
    fetchTickets();
  }

  Future<void> deleteTicket(String id) async {
    await _ticketCollection.doc(id).delete();
    fetchTickets();
  }

  // Definición de la función para obtener un ticket por ID
  Ticket? getTicketById(String id) {
    try {
      return _tickets.firstWhere((ticket) => ticket.id == id);
    } catch (e) {
      return null;
    }
  }
}

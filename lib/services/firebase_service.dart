import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ticket_model.dart';

class FirebaseService {
  final CollectionReference _ticketCollection = FirebaseFirestore.instance.collection('TicketAvion');

  Future<List<Ticket>> fetchTickets() async {
    var snapshot = await _ticketCollection.get();
    return snapshot.docs.map((doc) => Ticket.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<void> addTicket(Ticket ticket) async {
    await _ticketCollection.add(ticket.toMap());
  }

  Future<void> updateTicket(Ticket ticket) async {
    await _ticketCollection.doc(ticket.id).update(ticket.toMap());
  }

  Future<void> deleteTicket(String id) async {
    await _ticketCollection.doc(id).delete();
  }
}

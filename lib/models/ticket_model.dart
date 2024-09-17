class Ticket {
  String id;
  String numeroVuelo;
  String aerolinea;
  // Otros campos como origen, destino, etc.

  Ticket({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
  });

  factory Ticket.fromMap(Map<String, dynamic> data, String documentId) {
    return Ticket(
      id: documentId,
      numeroVuelo: data['numero_vuelo'] ?? '',
      aerolinea: data['aerolinea'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numero_vuelo': numeroVuelo,
      'aerolinea': aerolinea,
      // Otros campos
    };
  }
}

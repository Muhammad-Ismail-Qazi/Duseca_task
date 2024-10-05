class EventModel {
  String eventName;
  String description;
  String instructions;
  String date;
  String time;
  String location;
  String? fileUrl;

  EventModel({
    required this.eventName,
    required this.description,
    required this.instructions,
    required this.date,
    required this.time,
    required this.location,
    this.fileUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'description': description,
      'instructions': instructions,
      'date': date,
      'time': time,
      'location': location,
      'fileUrl': fileUrl,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      eventName: map['eventName'] ?? '', // Provide default value if null
      description: map['description'] ?? '',
      instructions: map['instructions'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      location: map['location'] ?? '',
      fileUrl: map['fileUrl'] as String?, // Allow null for fileUrl
    );
  }
}
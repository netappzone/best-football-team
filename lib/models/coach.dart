import 'package:equatable/equatable.dart';

class Coach extends Equatable {
  const Coach({
    this.id,
    this.name,
    this.dateOfBirth,
    this.nationality,
  });

  final int? id;
  final String? name;
  final DateTime? dateOfBirth;
  final String? nationality;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json['id'],
        name: json['name'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        nationality: json['nationality'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        dateOfBirth,
        nationality,
      ];
}

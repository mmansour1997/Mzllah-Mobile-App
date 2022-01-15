import 'package:flutter/foundation.dart';

class Coffee {
  final String id;
  final String title;
  final String region;
  final String altitude;
  final String process;
  final String varietal;
  final String cupping;
  final String description;
  final String imageUrl;

  Coffee({
    @required this.id,
    @required this.title,
    @required this.region,
    @required this.altitude,
    @required this.process,
    @required this.varietal,
    @required this.cupping,
    @required this.description,
    @required this.imageUrl,
  });
}

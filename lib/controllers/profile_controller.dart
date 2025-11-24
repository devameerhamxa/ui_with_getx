import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data
  final String userName = 'AHMAR TARIQ';
  final String username = '@CrazyDriver007';
  final String status = 'Burn Tyres';
  final String instagramHandle = 'IG: @ahmartariq';
  final int followers = 55;
  final int following = 100;
  
  // XP/Level data
  final String level = 'IGNITION';
  final int currentXP = 115;
  final int maxXP = 200;
  
  // Other data
  final int tickets = 10;
  final int connections = 145;
  
  // Computed properties
  double get xpProgress => currentXP / maxXP;
}


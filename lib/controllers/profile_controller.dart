import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data - using RxString for reactivity
  var userName = 'AHMAR TARIQ'.obs;
  var username = '@CrazyDriver007'.obs;
  var status = 'Burn Tyres'.obs;
  var instagramHandle = 'IG: @ahmartariq'.obs;
  var profileImagePath = 'assets/images/dp.jpg'.obs;
  final int followers = 55;
  final int following = 100;

  // Edit profile data
  var fullName = 'Ahmar Tariq'.obs;
  var bio = 'Burn Tyres 🌀\n@ahmarsggd'.obs;

  void updateProfile(String newFullName, String newBio) {
    fullName.value = newFullName;
    bio.value = newBio;
    // Update profile screen data
    userName.value = newFullName.toUpperCase();
    String statusText = newBio.split('\n').first;
    statusText = statusText.replaceAll('🌀', '').trim();
    status.value = statusText;
    // Extract Instagram handle
    if (newBio.contains('@') && newBio.contains('\n')) {
      final lines = newBio.split('\n');
      if (lines.length > 1) {
        final secondLine = lines[1].trim();
        if (secondLine.startsWith('@')) {
          instagramHandle.value = 'IG: $secondLine';
        } else if (secondLine.startsWith('IG: ')) {
          instagramHandle.value = secondLine;
        }
      }
    }
  }

  void updateProfileImage(String imagePath) {
    // If it's a file path (starts with /), use FileImage
    // Otherwise, it's an asset path
    profileImagePath.value = imagePath;
  }

  // XP/Level data
  final String level = 'IGNITION';
  final int currentXP = 115;
  final int maxXP = 200;

  // Other data
  final int tickets = 10;
  final int connections = 145;

  // Urban Apex data
  final Map<String, dynamic> _urbanApexData = {
    'imagePath': 'assets/images/urban.png',
    'title': 'URBAN APEX',
    'isActive': true,
    'difficulty': 'Hard',
    'date': '02 Oct 2025',
    'duration': '01:38.53',
  };

  List<Map<String, dynamic>> get urbanApexList =>
      List.generate(4, (_) => Map<String, dynamic>.from(_urbanApexData));

  // Computed properties
  double get xpProgress => currentXP / maxXP;
}

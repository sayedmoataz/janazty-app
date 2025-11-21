import 'package:url_launcher/url_launcher.dart';

class ShareService {
  static Future<void> shareToWhatsApp(String message) async {
    final url = Uri.parse(
      'https://wa.me/?text=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch WhatsApp');
    }
  }

  static Future<void> shareToTelegram(String message) async {
    final url = Uri.parse(
      'https://t.me/share/url?url=&text=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch Telegram');
    }
  }

  static Future<void> openGoogleMaps(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps?q=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not open Google Maps');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not make phone call');
    }
  }

  static String generateFuneralShareMessage({
    required String deceasedName,
    required String mosqueName,
    required String time,
    required String date,
  }) {
    return '''
🕌 إنا لله وإنا إليه راجعون

صلاة الجنازة على:
$deceasedName

📍 المسجد: $mosqueName
🕐 الوقت: $time
📅 التاريخ: $date

اللهم اغفر له وارحمه واعف عنه
شارك الأجر وحمّل تطبيق جنازتي:
[رابط التطبيق]
''';
  }

  static String generateServiceShareMessage({
    required String serviceName,
    required String phone,
    required String area,
  }) {
    return '''
خدمة جنائزية:
$serviceName

📞 التواصل: $phone
📍 المنطقة: $area

تطبيق جنازتي - دليل الخدمات الجنائزية
[رابط التطبيق]
''';
  }
}

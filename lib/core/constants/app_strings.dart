class AppStrings {
  static const String appName = 'جنازتي';
  static const String appDescription = 'القيراط مثل الجبل العظيم';
  static const String appNameDev = 'جنازتي (تجريبي)';

  // General
  static const String ok = 'حسناً';
  static const String cancel = 'إلغاء';
  static const String error = 'خطأ';
  static const String success = 'نجاح';
  static const String loading = 'جاري التحميل...';

  // Errors
  static const String serverError = 'حدث خطأ في الخادم';
  static const String networkError = 'لا يوجد اتصال بالإنترنت';
  static const String unexpectedError = 'حدث خطأ غير متوقع';

  // Navigation
  static const String todayJanazah = 'جنازات اليوم';
  static const String addJanazah = 'إضافة جنازة';

  static const String noJanazah =
      'لا توجد جنازات اليوم أو غداً\nاللهم اغفر لموتى المسلمين';

  // Add Funeral Screen
  static const String mosqueNameLabel = 'اسم المسجد *';
  static const String deceasedNameLabel = 'اسم المتوفى (اختياري)';
  static const String deceasedNameHint =
      'سيكتب "فقيد عائلة..." إذا تُرك فارغًا';
  static const String genderLabel = 'الجنس *';
  static const String genderMale = 'ذكر';
  static const String genderFemale = 'أنثى';
  static const String burialLocationLabel = 'مكان الدفن / المقابر (اختياري)';
  static const String burialLocationHint = 'مثال: مقابر العائلة، مقابر المدينة';
  static const String ageTypeLabel = 'المتوفى';
  static const String ageTypeAdult = 'بالغ';
  static const String ageTypeChild = 'طفل';
  static const String funeralNotesLabel = 'ملاحظات حول الجنازة (اختياري)';
  static const String funeralNotesHint =
      'مثال: الجنازة في الغسل، جاري استخراج التصاريح';
  static const String deceasedNotesLabel = 'ملاحظات حول المتوفى (اختياري)';
  static const String deceasedNotesHint = 'مثال: من عائلة فلان، نسيب فلان';
  static const String selectPrayerTime = 'اختر موعد الصلاة *';
  static const String selectMosqueLocation = 'اختر موقع المسجد *';
  static const String locationSelected = 'تم اختيار الموقع ✓';
  static const String submitFuneral = 'إضافة الجنازة';
  static const String unknownDeceased = 'غير معروف';

  // Validation Messages
  static const String pleaseEnterMosqueName = 'من فضلك أدخل اسم المسجد';
  static const String pleaseSelectPrayerTime = 'من فضلك اختر موعد الصلاة';
  static const String pleaseSelectLocation = 'من فضلك اختر موقع المسجد';

  // Success/Error Messages
  static const String funeralAddedSuccess = 'تم إضافة الجنازة بنجاح';
  static const String errorOccurred = 'حدث خطأ';
}

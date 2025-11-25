// Script to add dummy funerals data to Firestore
// Run with: node scripts/add_dummy_funerals.js

const admin = require('firebase-admin');

// Initialize Firebase Admin SDK
// Make sure you have your service account key JSON file
const serviceAccount = require('../service-account-key.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Helper function to get prayer time for tomorrow
function getTomorrowPrayerTime(hour, minute) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    tomorrow.setHours(hour, minute, 0, 0);
    return admin.firestore.Timestamp.fromDate(tomorrow);
}

// Dummy data for funerals
const dummyFunerals = [
    {
        deceasedName: 'أحمد محمد علي',
        gender: 'male',
        mosqueName: 'مسجد النور',
        mosqueLocation: 'مدينة نصر، القاهرة',
        lat: 30.0444,
        lng: 31.2357,
        prayerTime: getTomorrowPrayerTime(10, 0), // 10:00 AM tomorrow
        publisherId: 'user123',
        isMosqueVerified: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        fatherName: 'محمد علي',
        burialLocation: 'مقابر العائلة',
        ageType: 'adult',
        funeralNotes: 'الصلاة بعد صلاة الظهر مباشرة',
        prayedCount: 0,
        reportCount: 0,
    },
    {
        deceasedName: 'فاطمة حسن',
        gender: 'female',
        mosqueName: 'مسجد الرحمة',
        mosqueLocation: 'الهرم، الجيزة',
        lat: 29.9792,
        lng: 31.1342,
        prayerTime: getTomorrowPrayerTime(14, 30), // 2:30 PM tomorrow
        publisherId: 'user456',
        isMosqueVerified: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        fatherName: 'حسن أحمد',
        burialLocation: 'مقابر الرحمة',
        ageType: 'adult',
        funeralNotes: 'الصلاة بعد صلاة العصر',
        notes: 'رحمها الله',
        prayedCount: 0,
        reportCount: 0,
    },
    {
        deceasedName: 'عبد الله إبراهيم',
        gender: 'male',
        mosqueName: 'مسجد الفتح',
        mosqueLocation: 'المعادي، القاهرة',
        lat: 29.9602,
        lng: 31.2569,
        prayerTime: getTomorrowPrayerTime(11, 30), // 11:30 AM tomorrow
        publisherId: 'user789',
        isMosqueVerified: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        burialLocation: 'مقابر البساتين',
        ageType: 'adult',
        funeralNotes: 'الصلاة بعد صلاة الجمعة',
        prayedCount: 0,
        reportCount: 0,
    },
    {
        deceasedName: 'طفل صغير',
        gender: 'male',
        mosqueName: 'مسجد الهدى',
        mosqueLocation: 'شبرا، القاهرة',
        lat: 30.1219,
        lng: 31.2456,
        prayerTime: getTomorrowPrayerTime(9, 0), // 9:00 AM tomorrow
        publisherId: 'user321',
        isMosqueVerified: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        ageType: 'child',
        funeralNotes: 'إنا لله وإنا إليه راجعون',
        prayedCount: 0,
        reportCount: 0,
    },
    {
        deceasedName: 'خديجة محمود',
        gender: 'female',
        mosqueName: 'مسجد السلام',
        mosqueLocation: 'فيصل، الجيزة',
        lat: 30.0131,
        lng: 31.1656,
        prayerTime: getTomorrowPrayerTime(13, 0), // 1:00 PM tomorrow
        publisherId: 'user654',
        isMosqueVerified: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        fatherName: 'محمود عبد الرحمن',
        burialLocation: 'مقابر السلام',
        ageType: 'adult',
        funeralNotes: 'الصلاة بعد الظهر',
        notes: 'من عائلة آل محمود',
        prayedCount: 0,
        reportCount: 0,
    },
    {
        deceasedName: 'يوسف سعيد',
        gender: 'male',
        mosqueName: 'مسجد التقوى',
        mosqueLocation: 'مصر الجديدة، القاهرة',
        lat: 30.0876,
        lng: 31.3266,
        prayerTime: getTomorrowPrayerTime(15, 0), // 3:00 PM tomorrow
        publisherId: 'user987',
        isMosqueVerified: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        fatherName: 'سعيد يوسف',
        burialLocation: 'مقابر العائلة',
        ageType: 'adult',
        funeralNotes: 'الصلاة بعد العصر',
        prayedCount: 0,
        reportCount: 0,
    },
];

async function addDummyFunerals() {
    try {
        console.log('Starting to add dummy funerals...');

        for (const funeral of dummyFunerals) {
            const docRef = await db.collection('funerals').add(funeral);
            console.log(`✓ Added funeral for ${funeral.deceasedName} at ${funeral.mosqueName} (ID: ${docRef.id})`);
        }

        console.log('\n✓ Successfully added all dummy funerals!');
        console.log(`Total funerals added: ${dummyFunerals.length}`);
        console.log('All prayer times are set for tomorrow.');

        process.exit(0);
    } catch (error) {
        console.error('Error adding dummy funerals:', error);
        process.exit(1);
    }
}

addDummyFunerals();

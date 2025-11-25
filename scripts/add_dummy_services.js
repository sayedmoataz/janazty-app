// Script to add dummy services data to Firestore
// Run with: node scripts/add_dummy_services.js

const admin = require('firebase-admin');

// Initialize Firebase Admin SDK
// Make sure you have your service account key JSON file
const serviceAccount = require('../service-account-key.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Dummy data for services
const dummyServices = [
    // Washer services (مغسلين موتى)
    {
        type: 'washer',
        title: 'مغسل الرحمة - القاهرة',
        contactPhone: '01012345678',
        governorate: 'القاهرة',
        area: 'مدينة نصر',
        isFree: true,
        status: 'approved',
        details: 'خدمة تغسيل الموتى مجانية على مدار الساعة',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },
    {
        type: 'washer',
        title: 'مغسل النور - الجيزة',
        contactPhone: '01098765432',
        governorate: 'الجيزة',
        area: 'الهرم',
        isFree: false,
        status: 'approved',
        details: 'خدمة تغسيل احترافية برسوم رمزية',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },

    // Transport services (عربيات نقل موتى)
    {
        type: 'transport',
        title: 'نقل الموتى - الإسكندرية',
        contactPhone: '01123456789',
        governorate: 'الإسكندرية',
        area: 'سموحة',
        isFree: false,
        status: 'approved',
        details: 'خدمة نقل الموتى داخل وخارج المحافظة',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },
    {
        type: 'transport',
        title: 'سيارات نقل الموتى - القاهرة',
        contactPhone: '01234567890',
        governorate: 'القاهرة',
        area: 'مصر الجديدة',
        isFree: true,
        status: 'approved',
        details: 'نقل مجاني للموتى صدقة جارية',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },

    // Shroud services (أكفان صدقة)
    {
        type: 'shroud',
        title: 'أكفان الخير - القاهرة',
        contactPhone: '01156789012',
        governorate: 'القاهرة',
        area: 'شبرا',
        isFree: true,
        status: 'approved',
        details: 'توفير أكفان مجانية للموتى صدقة جارية',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },
    {
        type: 'shroud',
        title: 'أكفان البركة - الجيزة',
        contactPhone: '01267890123',
        governorate: 'الجيزة',
        area: 'فيصل',
        isFree: true,
        status: 'approved',
        details: 'أكفان عالية الجودة مجانية',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },

    // Cemetery services (مقابر صدقة)
    {
        type: 'cemetery',
        title: 'مقابر الرحمة - القاهرة',
        contactPhone: '01378901234',
        governorate: 'القاهرة',
        area: 'البساتين',
        isFree: true,
        status: 'approved',
        details: 'مقابر مجانية للمحتاجين',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },
    {
        type: 'cemetery',
        title: 'مقابر السلام - الجيزة',
        contactPhone: '01489012345',
        governorate: 'الجيزة',
        area: 'العجوزة',
        isFree: false,
        status: 'approved',
        details: 'مقابر مميزة بأسعار مناسبة',
        approvedBy: 'admin',
        approvedAt: admin.firestore.FieldValue.serverTimestamp(),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
    },
];

async function addDummyServices() {
    try {
        console.log('Starting to add dummy services...');

        for (const service of dummyServices) {
            const docRef = await db.collection('services').add(service);
            console.log(`✓ Added ${service.type} service: ${service.title} (ID: ${docRef.id})`);
        }

        console.log('\n✓ Successfully added all dummy services!');
        console.log(`Total services added: ${dummyServices.length}`);

        process.exit(0);
    } catch (error) {
        console.error('Error adding dummy services:', error);
        process.exit(1);
    }
}

addDummyServices();

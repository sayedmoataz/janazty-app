#!/bin/bash

# Script to add dummy services data to Firestore using Firebase CLI
# Make sure you're logged in: firebase login
# Make sure you've initialized Firebase: firebase init

echo "Adding dummy services to Firestore..."

# Array of service types
declare -a types=("washer" "transport" "shroud" "cemetery")

# Washer services
firebase firestore:write services/washer1 '{
  "type": "washer",
  "title": "مغسل الرحمة - القاهرة",
  "contactPhone": "01012345678",
  "governorate": "القاهرة",
  "area": "مدينة نصر",
  "isFree": true,
  "status": "approved",
  "details": "خدمة تغسيل الموتى مجانية على مدار الساعة",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

firebase firestore:write services/washer2 '{
  "type": "washer",
  "title": "مغسل النور - الجيزة",
  "contactPhone": "01098765432",
  "governorate": "الجيزة",
  "area": "الهرم",
  "isFree": false,
  "status": "approved",
  "details": "خدمة تغسيل احترافية برسوم رمزية",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

# Transport services
firebase firestore:write services/transport1 '{
  "type": "transport",
  "title": "نقل الموتى - الإسكندرية",
  "contactPhone": "01123456789",
  "governorate": "الإسكندرية",
  "area": "سموحة",
  "isFree": false,
  "status": "approved",
  "details": "خدمة نقل الموتى داخل وخارج المحافظة",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

firebase firestore:write services/transport2 '{
  "type": "transport",
  "title": "سيارات نقل الموتى - القاهرة",
  "contactPhone": "01234567890",
  "governorate": "القاهرة",
  "area": "مصر الجديدة",
  "isFree": true,
  "status": "approved",
  "details": "نقل مجاني للموتى صدقة جارية",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

# Shroud services
firebase firestore:write services/shroud1 '{
  "type": "shroud",
  "title": "أكفان الخير - القاهرة",
  "contactPhone": "01156789012",
  "governorate": "القاهرة",
  "area": "شبرا",
  "isFree": true,
  "status": "approved",
  "details": "توفير أكفان مجانية للموتى صدقة جارية",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

firebase firestore:write services/shroud2 '{
  "type": "shroud",
  "title": "أكفان البركة - الجيزة",
  "contactPhone": "01267890123",
  "governorate": "الجيزة",
  "area": "فيصل",
  "isFree": true,
  "status": "approved",
  "details": "أكفان عالية الجودة مجانية",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

# Cemetery services
firebase firestore:write services/cemetery1 '{
  "type": "cemetery",
  "title": "مقابر الرحمة - القاهرة",
  "contactPhone": "01378901234",
  "governorate": "القاهرة",
  "area": "البساتين",
  "isFree": true,
  "status": "approved",
  "details": "مقابر مجانية للمحتاجين",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

firebase firestore:write services/cemetery2 '{
  "type": "cemetery",
  "title": "مقابر السلام - الجيزة",
  "contactPhone": "01489012345",
  "governorate": "الجيزة",
  "area": "العجوزة",
  "isFree": false,
  "status": "approved",
  "details": "مقابر مميزة بأسعار مناسبة",
  "approvedBy": "admin",
  "approvedAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0},
  "createdAt": {"_seconds": '$(date +%s)', "_nanoseconds": 0}
}'

echo "✓ Successfully added all dummy services!"

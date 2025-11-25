# Scripts

This directory contains utility scripts for the Janazty project.

## Add Dummy Services

### Option 1: Manual Import (Easiest) ⭐

1. Open Firebase Console: https://console.firebase.google.com
2. Go to your project → Firestore Database
3. Click on "services" collection (create it if it doesn't exist)
4. For each service in `dummy_services.json`:
   - Click "Add document"
   - Use "Auto-ID" for document ID
   - Add each field manually from the JSON
   - For timestamps (`createdAt`, `approvedAt`), use type "timestamp" and set to current time

**Services to add (8 total):**
- 2 Washer services (مغسلين موتى)
- 2 Transport services (عربيات نقل موتى)
- 2 Shroud services (أكفان صدقة)
- 2 Cemetery services (مقابر صدقة)

### Option 2: Node.js Script

If you prefer automation, use the Node.js script.

#### Prerequisites

1. Install Node.js dependencies:
```bash
npm install firebase-admin
```

2. Download your Firebase service account key:
   - Go to Firebase Console → Project Settings → Service Accounts
   - Click "Generate New Private Key"
   - Save the JSON file as `service-account-key.json` in the project root

#### Usage

Run the script from the project root:

```bash
node scripts/add_dummy_services.js
```

## Add Dummy Funerals

### Option 1: Node.js Script (Easiest) ⭐

1. Install firebase-admin if not already installed:
```bash
npm install firebase-admin
```

2. Make sure you have `service-account-key.json` in the project root (see instructions above)

3. Run the script:
```bash
node scripts/add_dummy_funerals.js
```

The script will automatically:
- Add 6 funeral entries to Firestore
- Set all prayer times for tomorrow
- Use server timestamps for `createdAt`

### Option 2: Manual Import

1. Open Firebase Console: https://console.firebase.google.com
2. Go to your project → Firestore Database
3. Click on "funerals" collection (create it if it doesn't exist)
4. For each funeral in `dummy_funerals.json`:
   - Click "Add document"
   - Use "Auto-ID" for document ID
   - Add each field manually from the JSON
   - For timestamps (`prayerTime`, `createdAt`), use type "timestamp"
   - For `prayerTime`, set to tomorrow's date with appropriate prayer times
   - For `createdAt`, set to current time

**Funerals to add (6 total):**
- Mix of male and female deceased
- Different mosques and locations in Cairo and Giza
- Various prayer times throughout the day
- Mix of verified and unverified mosques

### Security Note

⚠️ **Important**: Never commit `service-account-key.json` to version control. It's already added to `.gitignore`.

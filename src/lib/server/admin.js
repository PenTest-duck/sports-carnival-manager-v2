// @ts-nocheck
// Credits: https://fireship.io/courses/sveltekit/setup-firebase-admin/

// Imports
import { getAuth } from 'firebase-admin/auth';
import { FIREBASE_CLIENT_EMAIL, FIREBASE_PRIVATE_KEY, FIREBASE_PROJECT_ID } from '$env/static/private'
import pkg from 'firebase-admin';

// Initialises Firebase Admin SDK
try {
    pkg.initializeApp({
        // Credentials imported from env
        credential: pkg.credential.cert({
            projectId: FIREBASE_PROJECT_ID,
            clientEmail: FIREBASE_CLIENT_EMAIL,
            privateKey: FIREBASE_PRIVATE_KEY,
        }),
    });
} catch (e) {
    console.log('Firebase Admin Error: ', e);
}

// Exports Firebase auth object
export const adminAuth = getAuth();
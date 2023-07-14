// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, onAuthStateChanged, type User } from "firebase/auth";
import { writable } from "svelte/store";
//import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional

// Import environment variables
import { FIREBASE_API_KEY, FIREBASE_AUTHDOMAIN, FIREBASE_PROJECT_ID, FIREBASE_STORAGE_BUCKET, FIREBASE_MESSAGING_SENDER_ID, FIREBASE_APP_ID, FIREBASE_MEASUREMENT_ID } from "$env/static/private";

const firebaseConfig = {
	apiKey: FIREBASE_API_KEY,
  	authDomain: FIREBASE_AUTHDOMAIN,
  	projectId: FIREBASE_PROJECT_ID,
  	storageBucket: FIREBASE_STORAGE_BUCKET,
  	messagingSenderId: FIREBASE_MESSAGING_SENDER_ID,
  	appId: FIREBASE_APP_ID,
  	measurementId: FIREBASE_MEASUREMENT_ID
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Get authentication status
export const auth = getAuth(app);

// Function: userStore
// Purpose: set up writable store for user
// Parameters: N/A
// Returns: writable store subscription
function userStore() {
	// Initialise unsubscribe
  	let unsubscribe: () => void;

	// Set store to null if authentication object does not exist
  	if (!auth || !globalThis.window) {
   		console.log('Auth is not initialized or not in browser');
    	const { subscribe } = writable<User | null>(null);
    	return { subscribe }
  	}

	// Set writable store to current user 
  	const { subscribe } = writable(auth?.currentUser ?? null, (set) => {
		// Unsubscribe when logging out
    	unsubscribe = onAuthStateChanged(auth, (user) => {
      		set(user);
    	});

    	return () => unsubscribe();
 	});

  	return { subscribe };
}

// Export user store
export const user = userStore();

console.log("Firebase initialised.");
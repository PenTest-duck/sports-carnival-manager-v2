// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, onAuthStateChanged, type User } from "firebase/auth";
import { writable } from "svelte/store";
//import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
	apiKey: "AIzaSyCu4aXiuVJPtC6t3HTiCkzdia-8Vu6a9rI",
  	authDomain: "sports-carnival-manager.firebaseapp.com",
  	projectId: "sports-carnival-manager",
  	storageBucket: "sports-carnival-manager.appspot.com",
  	messagingSenderId: "587550867359",
  	appId: "1:587550867359:web:ba40be47895078d1d247aa",
  	measurementId: "G-4GVYSV4GH4"
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
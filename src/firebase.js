// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
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
//const analytics = getAnalytics(app);

export const auth = getAuth(app);

console.log("Firebase initialised.");
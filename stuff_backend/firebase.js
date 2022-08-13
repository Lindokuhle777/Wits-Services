// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getFirestore } from "firebase/firestore";
// import * as firebase from 'firebase'

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyD5hma8Y5uVWKnG0kOzurCRedMR9Er1uCM",
  authDomain: "wits-services-ea5cf.firebaseapp.com",
  projectId: "wits-services-ea5cf",
  storageBucket: "wits-services-ea5cf.appspot.com",
  messagingSenderId: "147092371359",
  appId: "1:147092371359:web:d6cd2585fe5d309a4dafaa",
  measurementId: "G-PD1BJT0XV6"
};

// Initialize Firebase
// console.log(firebase.apps.length);
const app = initializeApp(firebaseConfig);
// const app = firebase.app();
export const db = initializeApp(getFirestore);
const analytics = getAnalytics(app);
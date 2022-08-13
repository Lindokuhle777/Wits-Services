import express from "express";
import {
  collection,
  doc,
  getDocs,
  setDoc
} from "firebase/firestore";
import { db } from "../firebase.js";

const router = express.Router();

const data = [
    {
        vehName:"Avanza",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Hoonda",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Avanza",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Hoonda",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Avanza",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Hoonda",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Avanza",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Hoonda",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Avanza",
        plateNum:"CBB 734 EC"
    },
    {
        vehName:"Hoonda",
        plateNum:"CBB 734 EC"
    },
];

router.get("/",async (req, res) => {

    const ref = doc(db,"Vehicles","CampusControlVehicles");

    await setDoc(ref,{vehicles:data})


});

export default router;
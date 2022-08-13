import cors from "cors";
import express from "express";
import GetVehicles from "./routes/GetVehicles.js";

const app = express();

const PORT = process.env.PORT || 5000;

//to be updated for sso
// middleware
app.use(express.json());
app.use(cors());

//routes
app.use("/GetVehicles",GetVehicles);



app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
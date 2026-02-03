
import express from "express";
import cors from "cors";
import { prisma } from "@repo/db/client";
import 'dotenv/config';
const app = express();
app.use(express.json());
app.use(cors());

app.post("/signup" , async (req , res) => {
    
    const { email , name } = req.body;

    const user = await prisma.user.create({
        data : {
            name,
            email
        },
        select : {
            id : true
        }
    });

    res.status(200).json({
        message : "user created",
        id : user.id
    })
})

app.listen(3002 , () => {
    console.log("app is running on port : " , 3002);
})
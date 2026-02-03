import { WebSocketServer } from 'ws';
import { prisma } from "@repo/db/client";

const wss = new WebSocketServer({ port: 8080 });

wss.on('connection', function connection(ws) {
  ws.on('error', console.error);
  console.log("user connected");
  

  ws.on('message', async function message(data) {

    
    const user = await prisma.user.create({
        data : {
            email : Math.random().toString(),
            name : Math.random().toString()
        },
        select : {
            id : true
        }
    });

    ws.send(`user created with id : ${user.id}`);
  });

  ws.send('something');
});
import Image from "next/image";
import { prisma } from "@repo/db/client";

export default async function Home() {
  const users = await prisma.user.findFirst();
  console.log("users : " , users);
  

  return (
   <div>
    {
      JSON.stringify(users)
    }
   </div>
  );
}

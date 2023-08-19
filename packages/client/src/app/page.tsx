'use client'

import Image from "next/image";
import {useState} from "react";

export default function Home() {
  const [isConnected, seteIsConnected] = useState<boolean>(true)
  return (
    <main className="flex min-h-screen flex-col md:flex-row items-center justify-between p-24">
      <div>
        <h2 className={"text-[90px] md:text-[150px] font-bold"}>NKZ NFT</h2>
        <img
          src="https://avatars.githubusercontent.com/u/14988862?v=4"
          alt=""
        />
      </div>
      <div>
        <p>NKZ NFT Project is an experimental project.</p>
        <div className={"flex flex-col"}>
          {isConnected ? (
            <button className={"bg-gray-400 font-bold p-4 mb-1"}>
              0x0000000
            </button>
          ) : (
            <button className={"bg-gray-400 font-bold p-4 mb-1"}>
              Connect Wallet
            </button>
          )}
          <button className={"bg-gray-400 font-bold p-4 mb-1"}>Mint🌱</button>
        </div>
      </div>
    </main>
  );
}

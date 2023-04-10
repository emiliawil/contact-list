"use client";

import Image from "next/image";
import { Inter } from "next/font/google";
import { useEffect } from "react";
import { themeChange } from "theme-change";

const inter = Inter({ subsets: ["latin"] });

export default function Home() {
  useEffect(() => {
    themeChange(false);
    // 👆 false parameter is required for react project
  }, []);
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="text-6xl font-bold">Hello World</h1>
      <div className="m-5">
        <h2 className="mb-4 text-2xl text-green-700 font-bold">Select</h2>
        <select
          data-choose-theme
          className="focus:outline-none h-10 rounded-full px-3 border"
        >
          <option value="cupcake">Cupcake</option>
          <option value="dracula">Dracula</option>
          <option value="cmyk">CMYK</option>
          <option value="synthwave">Synthwave</option>
          <option value="valentine">Valentine</option>
        </select>
      </div>
    </main>
  );
}

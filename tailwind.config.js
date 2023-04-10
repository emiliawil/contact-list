/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./app/**/*.{js,ts,jsx,tsx}",
  ],
  daisyui: {
    themes: ["cupcake", "synthwave", "valentine", "dracula", "cmyk"],
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "dracula",
    lightTheme: "cupcake",
  },
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
};

/* 
import { useEffect } from 'react'
import { themeChange } from 'theme-change'

useEffect(() => {
  themeChange(false)
  // 👆 false parameter is required for react project
}, [])
*/

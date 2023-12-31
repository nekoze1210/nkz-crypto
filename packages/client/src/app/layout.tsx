import "./globals.css";
import type { Metadata } from "next";
import { Inter, Playfair_Display } from "next/font/google";

const inter = Inter({ subsets: ["latin"] });
const playfairDisplay = Playfair_Display({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`bg-[#E5EBE2] ${playfairDisplay.className}`}>
        {children}
      </body>
    </html>
  );
}

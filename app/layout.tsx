import "./globals.css";

export const metadata = {
  title: "Contact List",
  description: "A simple contact list app",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html data-theme="cupcake" lang="en">
      <body>{children}</body>
    </html>
  );
}

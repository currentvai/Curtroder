# Curtroder - A Dynamic Theme for Termux

Welcome to Curtroder! A beautiful, dynamic, and personalized theme for your Termux terminal that makes you feel like a pro. This theme includes a loading animation, a custom ASCII banner with your name, and a pinned header that stays even after clearing the screen.

![screenshot](link-to-your-screenshot.png)  <!-- এখানে একটি স্ক্রিনশটের লিঙ্ক দেবেন -->

## ✨ Features

-   **Loading Animation:** A cool "hacker-style" loading animation on startup.
-   **Dynamic Banner:** Generates a banner with the name you provide during installation.
-   **Pinned Header:** The banner stays at the top, even when you use the `clear` command.
-   **System Info:** Shows the current Date, Time, and your Public IP address.
-   **Custom Prompt:** A colorful and informative command prompt.

## 🚀 Installation

To install Curtroder, simply copy and paste the following commands into your Termux terminal.

```bash
# Update package lists and install git
pkg update && pkg upgrade -y
pkg install git -y

# Clone the repository
git clone https://github.com/your-username/curtroder.git

# Navigate into the directory and run the installer
cd curtroder
bash install.sh
```
After the installation is complete, just restart your Termux app!

## 🔧 Uninstallation

If you want to remove Curtroder and restore your old configuration, run these commands:

```bash
# This will restore your old .bashrc file
mv ~/.bashrc.bak ~/.bashrc

# Restart Termux to apply changes
```
This will bring back your previous Termux prompt.

## ❤️ Credits

-   **Devoloped By:** Current Vai ♚
    I am completely destroyed. Error 304 Not Modified.
---**© Copyright 2025 — All Rights Reserved.**

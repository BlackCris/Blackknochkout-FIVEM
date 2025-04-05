# 🛡️ BlackKnockout - Anti Knockout Script for FiveM

**BlackKnockout** is a lightweight anti-knockout system designed for FiveM servers.  
It prevents players from being forced into ragdoll or stealth movement by blocking common knockout behaviors both client and server side.

---

## ✨ Features

- 🚫 Prevents stealth movement (`SetPedStealthMovement`)
- 🧍‍♂️ Disables ragdoll effect for players
- 🛑 Blocks knockout attempts from other players (both client & server)
- 🧼 Auto-clears ragdoll state if triggered
- 🔒 Intercepts and cancels suspicious server events
- 🔔 Optional logging or kicking for detected abuse

---

## 📁 File Structure

```
Blackknochkout/
├── client.lua          # Handles anti-knockout detection and protection
├── server.lua          # Prevents server-side knockout events (optional)
├── fxmanifest.lua      # Resource declaration
└── .vscode/settings.json
```

---

## ⚙️ Usage

1. Place the `Blackknochkout` folder in your server's `resources` directory.
2. Add the following line to your `server.cfg`:

```
ensure Blackknochkout
```

3. (Optional) Edit `server.lua` to enable logging or punishments on abuse detection.

---

## 🔧 Notes

- By default, the ragdoll state and stealth mode are automatically blocked every 200ms.
- Server-side protection only activates if a script tries to force a knockout via event.
- This script is intended as a lightweight protection system and may not block every edge-case mod if heavily bypassed.

---

## 📜 License

MIT License – Free to use, modify, and distribute with attribution.

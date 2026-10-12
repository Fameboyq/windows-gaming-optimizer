<div align="center">

# ⚡ Windows Gaming Optimizer & Latency Debloater

**One-Click Windows 10 & 11 Performance Optimizer, Latency Reduction & Debloater**

[![Windows](https://img.shields.io/badge/Windows-10%20%2F%2011-000000?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Fameboyq/windows-gaming-optimizer)
[![License](https://img.shields.io/badge/License-MIT-000000?style=for-the-badge)](LICENSE)
[![Optimizations](https://img.shields.io/badge/Tweaks-Low%20Latency-000000?style=for-the-badge)](https://github.com/Fameboyq/windows-gaming-optimizer)
[![Telegram](https://img.shields.io/badge/Telegram-@fameboyq-000000?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/fameboyq)
[![Donate](https://img.shields.io/badge/Donate-DonationAlerts-000000?style=for-the-badge)](https://www.donationalerts.com/r/fameboyq)

</div>

---

## 📌 Overview / Обзор

**EN:** A lightweight, transparent, modular batch toolkit designed to reduce system latency, stabilize 1% lows, eliminate input lag, and debloat Windows 10/11 background overhead for competitive gaming (CS2, Valorant, Apex, Fortnite, Dota 2).

**RU:** Модульный и прозрачный скрипт для снижения системных задержек (input lag), стабилизации 0.1% и 1% FPS, отключения фонового мусора Windows 10/11 и оптимизации сетевого стека для соревновательных игр.

---

## 🚀 Key Features / Возможности

- **Power Plan:** Unlocks and sets the hidden **Ultimate Performance** power plan scheme.
- **GameDVR & Game Bar:** Completely disables Xbox GameDVR, background recording, and Game Bar broadcasting hooks to eliminate stutter.
- **1:1 Mouse Input:** Disables Windows pointer acceleration (Enhanced Pointer Precision), resets thresholds to zero for true raw input response.
- **Network & TCP Low Latency:** Configures TCP global autotuning, disables Nagle's algorithm and chimney/heuristics for responsive ping.
- **System Responsiveness:** Sets Multimedia Class Scheduler (MMCSS) system responsiveness to max gaming priority (`NetworkThrottlingIndex = 0xFFFFFFFF`, `SystemResponsiveness = 0`).
- **GPU Scheduling & DWM:** Sets Game task scheduling priority to High / 8.
- **Cache & Temp Cleaner:** Purges Windows Temp, Prefetch, DirectX Shader Cache (NVIDIA/AMD), Delivery Optimization, and flushes DNS.
- **Safety First:** Includes a 1-click option to create a Windows System Restore Point prior to applying modifications.

---

## 🛠️ Usage / Инструкция по запуску

1. Clone or download this repository:
   ```bash
   git clone https://github.com/Fameboyq/windows-gaming-optimizer.git
   ```
2. Navigate into the folder:
   ```bash
   cd windows-gaming-optimizer
   ```
3. Right-click **`optimizer.bat`** and select **Run as Administrator** (or double click; it will prompt for elevation).
4. *(Recommended)* Select **`[8]`** to create a System Restore Point.
5. Select **`[1]`** for **Full Optimization**, or choose individual modules:
   - `[2]` Apply Registry Gaming Tweaks
   - `[3]` Enable Ultimate Performance Plan
   - `[4]` Disable GameDVR / Xbox Bar
   - `[5]` Fix Mouse Acceleration / Raw Input
   - `[6]` Network & TCP Tweaks
   - `[7]` Clean Temporary Caches
6. Restart your PC for all kernel and driver tweaks to take full effect.

---

## 📁 Repository Structure / Структура

```
windows-gaming-optimizer/
├── optimizer.bat          # Main interactive elevated script
├── scripts/
│   ├── tweaks.reg         # Safe registry gaming & latency optimizations
│   └── clean_temp.bat     # Temp files, prefetch & shader cache cleaner
├── .github/
│   └── FUNDING.yml        # Sponsorship & donation links
├── LICENSE                # MIT License
└── README.md              # Documentation
```

---

## ⚠️ Disclaimer / Отказ от ответственности

All tweaks modify registry and network configurations safely. A System Restore Point is provided directly in the menu (`[8]`). Use at your own discretion.

---

## ☕ Support & Contact

- **Telegram:** [@fameboyq](https://t.me/fameboyq)
- **DonationAlerts:** [donationalerts.com/r/fameboyq](https://www.donationalerts.com/r/fameboyq)

---

<div align="center">
  <sub>Developed by <b>Fameboyq</b> • Licensed under MIT</sub>
</div>

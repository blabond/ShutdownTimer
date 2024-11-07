# Shutdown Timer with Hotkey Automation

![Shutdown Timer Screenshot](https://github.com/blabond/ShutdownTimer/blob/main/img/pctool.png)

## Overview

A PowerShell-based application with a user-friendly GUI for scheduling system shutdowns based on:

- Specific time
- Closing a specific window
- Either time or window closing

Additionally, it offers optional hotkey automation by sending the F13 key at random intervals, which can be useful to keep the system active or prevent idle states.

**Note:** The source code (`ShutdownTimer.ps1`) is available in this repository for viewing. For easy use, a compiled executable file (`ShutdownTimer.exe`) is provided for download.

## Features

- **GUI Interface**: Easy-to-use graphical interface built with WPF.
- **Flexible Shutdown Options**:
  - Shutdown at a specific time.
  - Shutdown after closing a specific window.
  - Shutdown at a specific time or when a window is closed, whichever occurs first.
- **Hotkey Automation**:
  - Sends the F13 key at random intervals between 182 and 280 seconds.
  - Can be enabled or disabled as needed.

## Download

- **Executable File**: [Download ShutdownTimer.exe](https://github.com/blabond/ShutdownTimer/releases)
  - The executable file has been compiled from the PowerShell script for convenience.
- **Source Code**: Available in this repository as `ShutdownTimer.ps1`.

## Getting Started

### Prerequisites

- **For the executable file**:
  - Windows operating system.
- **For the PowerShell script**:
  - Windows PowerShell.
  - Execution policy must allow running scripts (you may need to set `Set-ExecutionPolicy RemoteSigned`).

### Installation

1. **Download the Executable File**:
   - Download the `ShutdownTimer.exe` file from the [Releases](https://github.com/blabond/ShutdownTimer/releases) section.
   - No installation required; simply run the executable file.
2. **Alternatively: Run the PowerShell Script**:
   - Clone the repository or download the `ShutdownTimer.ps1` file directly.
   - Open PowerShell, navigate to the script directory, and execute `.\ShutdownTimer.ps1`.

## Usage

1. **Select an Option**:
   - **Send Hotkey Only**: Only sends the F13 key at random intervals.
   - **Shutdown at Specific Time**: Shuts down the system at the specified time.
   - **Shutdown after Closing a Window**: Shuts down the system after the selected window is closed.
   - **Shutdown at Time or Window Close**: Shuts down at the specified time or when the window is closed, whichever occurs first.
2. **Enable Hotkey Sending (optional)**:
   - Check the box if you want to enable hotkey automation (F13).
3. **Enter End Time**:
   - Enter the time in HHmm format (e.g., 2230 for 10:30 PM).
4. **Select Window (if applicable)**:
   - Choose the window to monitor from the dropdown list.
5. **Start**:
   - Click the "Start" button to begin the timer.
6. **Status Monitoring**:
   - The status label displays the remaining time and/or the window monitoring status.
   - If hotkey sending is enabled, the next hotkey send time is displayed.


---------------------------DEUTSCH---------------------------

# Shutdown Timer mit Hotkey-Automatisierung

## Übersicht

Eine auf PowerShell basierende Anwendung mit einer benutzerfreundlichen GUI zum Planen von Systemabschaltungen basierend auf:

- Bestimmter Uhrzeit
- Schließen eines bestimmten Fensters
- Entweder Uhrzeit oder Fensterschließen

Zusätzlich bietet sie eine optionale Hotkey-Automatisierung durch Senden der F13-Taste in zufälligen Intervallen, was nützlich sein kann, um das System aktiv zu halten oder Leerlaufzustände zu verhindern.

**Hinweis:** Der Quellcode (`ShutdownTimer.ps1`) ist in diesem Repository zur Ansicht verfügbar. Für eine einfache Nutzung wird eine kompilierte ausführbare Datei (`ShutdownTimer.exe`) zum Download bereitgestellt.

## Funktionen

- **GUI-Interface**: Einfach zu bedienende grafische Oberfläche mit WPF.
- **Flexible Abschaltoptionen**:
  - Abschaltung zu einer bestimmten Uhrzeit.
  - Abschaltung nach dem Schließen eines Fensters.
  - Abschaltung zu einer bestimmten Uhrzeit oder wenn ein Fenster geschlossen wird, je nachdem, was zuerst eintritt.
- **Hotkey-Automatisierung**:
  - Sendet die F13-Taste in zufälligen Intervallen zwischen 182 und 280 Sekunden.
  - Kann nach Bedarf aktiviert oder deaktiviert werden.

## Download

- **Ausführbare Datei**: [ShutdownTimer.exe herunterladen](https://github.com/blabond/ShutdownTimer/releases)
  - Die ausführbare Datei wurde zur Bequemlichkeit aus dem PowerShell-Skript kompiliert.
- **Quellcode**: Verfügbar in diesem Repository als `ShutdownTimer.ps1`.

## Erste Schritte

### Voraussetzungen

- **Für die ausführbare Datei**:
  - Windows-Betriebssystem.
- **Für das PowerShell-Skript**:
  - Windows PowerShell.
  - Ausführungsrichtlinie muss das Ausführen von Skripten erlauben (ggf. `Set-ExecutionPolicy RemoteSigned` setzen).

### Installation

1. **Ausführbare Datei herunterladen**:
   - Laden Sie die `ShutdownTimer.exe` Datei aus dem [Releases](https://github.com/blabond/ShutdownTimer/releases) Bereich herunter.
   - Keine Installation erforderlich; führen Sie einfach die ausführbare Datei aus.
2. **Alternativ: PowerShell-Skript ausführen**:
   - Klonen Sie das Repository oder laden Sie die `ShutdownTimer.ps1` Datei direkt herunter.
   - Öffnen Sie PowerShell, navigieren Sie zum Skriptverzeichnis und führen Sie `.\ShutdownTimer.ps1` aus.

## Verwendung

1. **Option auswählen**:
   - **Nur Hotkey senden**: Sendet nur die F13-Taste in zufälligen Intervallen.
   - **Zu einer bestimmten Zeit herunterfahren**: Fährt das System zur angegebenen Zeit herunter.
   - **Nach Schließen eines Fensters herunterfahren**: Fährt das System herunter, nachdem das ausgewählte Fenster geschlossen wurde.
   - **Herunterfahren bei Zeit oder Fenster schließen**: Fährt zur angegebenen Zeit oder beim Schließen des Fensters herunter, je nachdem, was zuerst eintritt.
2. **Hotkey-Senden aktivieren (optional)**:
   - Aktivieren Sie das Kontrollkästchen, wenn Sie die Hotkey-Automatisierung (F13) einschalten möchten.
3. **Endzeit eingeben**:
   - Geben Sie die Zeit im HHmm-Format ein (z. B. 2230 für 22:30 Uhr).
4. **Fenster auswählen (falls zutreffend)**:
   - Wählen Sie das zu überwachende Fenster aus der Dropdown-Liste.
5. **Starten**:
   - Klicken Sie auf die Schaltfläche "Start", um den Timer zu starten.
6. **Statusüberwachung**:
   - Das Statuslabel zeigt die verbleibende Zeit und/oder den Überwachungsstatus des Fensters an.
   - Wenn das Hotkey-Senden aktiviert ist, wird die nächste Hotkey-Sendezeit angezeigt.

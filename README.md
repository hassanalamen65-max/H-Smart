# H-Smart - Professional HVAC Building Management System

## Overview
H-Smart is a professional mobile application for monitoring and managing HVAC (Heating, Ventilation, and Air Conditioning) systems and smart building infrastructure. The application provides real-time monitoring, alerts, analytics, and scheduling capabilities through an intuitive and modern interface.

## Features

### Dashboard
- Real-time temperature monitoring with circular gauge display
- Building-wide status overview
- Status cards showing: Active, Warning, Critical, and Total units
- Interactive building map with room status visualization

### AC Unit Management
- Searchable list of all AC units
- Real-time device status and temperature display
- Power consumption monitoring
- Performance metrics

### Alerts & Notifications
- Real-time alert system
- Two severity levels: Warning and Critical
- Alert acknowledgment and resolution

### Analytics
- Daily and weekly temperature trends
- Power consumption analysis
- Device performance metrics

### Scheduling
- Create custom schedules for AC units
- Set operating days and times
- Target temperature configuration

## Design System

### Colors
- **Background**: #0B0F14
- **Status OK**: #3BA8FF (Blue)
- **Status Warning**: #FFC107 (Amber)
- **Status Critical**: #FF4D4D (Red)

## Project Structure

```
lib/
├── config/
│   ├── theme/
│   └── constants/
├── models/
├── providers/
└── screens/
```

## Firebase Collections

### AC_Units
- deviceId, deviceName, roomName, temperature, humidity, powerConsumption, status, performance, fanSpeed, lastUpdate

### Alerts
- alertId, deviceId, roomName, severity, title, description, recommendedAction, createdAt, resolvedAt, isResolved

### Rooms
- roomName, status, averageTemperature, totalDevices, activeDevices, warningDevices, criticalDevices

## Getting Started

1. Install dependencies: `flutter pub get`
2. Configure Firebase with your credentials
3. Run: `flutter run`

## Dependencies
- Firebase (Auth, Firestore, Storage, Messaging)
- Provider (State Management)
- FL Chart (Charts)
- Material 3 (UI)

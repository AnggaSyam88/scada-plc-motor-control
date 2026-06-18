# SCADA & PLC Integration: Sequential Motor Control with Failsafe Interlock ⚙️⚡

A Software-in-the-Loop (SITL) simulation demonstrating an industrial Motor Control Center (MCC). This project integrates a programmable logic controller (OpenPLC) with a supervisory dashboard (Node-RED) via Modbus TCP to manage sequential motor start-ups and emergency safety interlocks.

## 🏗️ System Architecture & Topologi
![Architecture Diagram](diagram.jpg)

* **Control Layer (OT):** OpenPLC v4 executing IEC 61131-3 Ladder Diagram logic.
* **Supervisory Layer (IT):** Node-RED providing a real-time Human-Machine Interface (HMI).
* **Communication Protocol:** Machine-to-Machine (M2M) communication over **Modbus TCP (Port 502)**.

## 💡 Key Features
1. **Sequential Start-Up:** Utilizes a Timer On Delay (TON) block (5000ms) to prevent excessive inrush current by staggering the activation of heavy loads (Motor 1 & Motor 2).
2. **Preventive Safety Interlock:** Implements a Failsafe mechanism using a Normally Closed (NC) contact. If an anomaly is detected prior to sequence completion, the secondary actuator is blocked from starting.
3. **Running Fault Protection:** Instantly cuts power to the secondary motor if an overload is simulated during full operation, preserving the primary system and preventing mechanical failure.
4. **Real-Time I/O Mapping:** Zero-delay synchronization between the physical memory addresses (`%QX0.0`, `%QX0.2`, etc.) and the SCADA dashboard.

## 📂 Repository Contents
* `ladder_logic.st` : The OpenPLC program file containing the sequential logic and interlocks.
* `hmi_dashboard.json` : The Node-RED flow export containing the Modbus nodes, logic functions, and UI elements.
* `diagram.jpg` : High-level network topology.

## 🚀 How to Run the Simulation
### Prerequisites
* [OpenPLC Editor / Runtime](https://autonomylogic.com/)
* [Node-RED](https://nodered.org/) with `node-red-contrib-modbus` and `node-red-dashboard` palettes installed.

### Execution Steps
1. **PLC Setup:** Import the `.st` file into OpenPLC Editor. Enable the Modbus TCP Server on port `502` in the device configuration. Click 'Play/Debug' to start the runtime.
2. **HMI Setup:** Import the `.json` file into your Node-RED workspace. Ensure the Modbus Write/Read nodes are pointing to `localhost` (or your specific IP) on port `502`. Click 'Deploy'.
3. **Commissioning:** Navigate to `http://localhost:1880/ui` to access the dashboard and control the virtual MCC.

## 📺 Live Demonstration
Watch the full simulation and fault testing scenarios on my LinkedIn post: 
(https://drive.google.com/file/d/1e7CvREMpU1ziyJH4cg7Q8XbnFtDAVxy-/view?usp=sharing)

---
*Designed for continuous learning in Industrial Automation, IIoT, and Control Systems Engineering.*

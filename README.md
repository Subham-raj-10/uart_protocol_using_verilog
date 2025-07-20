# uart_protocol_using_verilog
This project implements a complete UART (Universal Asynchronous Receiver Transmitter) communication system in Verilog, including both the transmitter and receiver modules with 8-bit data handling, start/stop bits, and parity checking.
UART Transmitter:
-FSM-based TX control
-PISO (Parallel-In-Serial-Out) shift register
-Start bit, data bits, parity bit, and stop bit generation
-Parity generator with configurable logic

UART Receiver:
-FSM-based RX control
-SIPO (Serial-In-Parallel-Out) register
-Start, parity, and stop bit detection
-Error checking for parity and stop bit

Data Width: 8-bit
Baud Rate: Customizable
Error Handling: Parity error and stop bit error detection
Tools Used: AMD Vivado.

<img width="715" height="462" alt="image" src="https://github.com/user-attachments/assets/8b6e5abf-f53a-40db-9500-6465f1f19a87" />
<img width="822" height="528" alt="image" src="https://github.com/user-attachments/assets/e8f7bbe0-e490-4b28-b655-17bb2d95988c" />



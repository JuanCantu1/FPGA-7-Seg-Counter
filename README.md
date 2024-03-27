# 7-Segment Counter Project

This repository contains Verilog code for a 7-segment counter designed to run on the Basys 3 FPGA board. The project utilizes a 100MHz clock source to create a counter that displays numbers incrementing on a 7-segment LED display.

## Module Description
The Verilog module `Juan_cantu_7_Seg_Counter_01` consists of the following components:

- `clock_100Mhz`: Input representing the 100MHz clock source.
- `reset`: Input for resetting the counter.
- `Anode_Activate`: Output representing the anode signals of the 7-segment LED display.
- `LED_out`: Output representing the cathode patterns of the 7-segment LED display.

The module utilizes internal registers and wires for counting, generating clock enables, and displaying numbers on the LED display.

## Functionality
- The module counts up from 0 to 9999, displaying each number sequentially on the 7-segment LED display.
- A 1-second enable signal is generated to control the counting rate.
- The counting and display refresh are synchronized with the 100MHz clock signal.
- The `reset` input initializes the counter to zero.
- The `Anode_Activate` output activates specific segments of the 7-segment display to represent digits.
- The `LED_out` output provides patterns to light up corresponding segments on the display.

## Conclusion

Overall this project provided an opportunity to develop a 7-segment counter using Verilog for the Basys 3 FPGA board. By leveraging a 100MHz clock source, the counter seamlessly increments and displays numbers on the 7-segment LED display.

Through this project, I gained valuable experience in:
- Designing and implementing digital circuits using Verilog.
- Utilizing FPGA resources effectively to achieve desired functionality.
- Understanding clock synchronization and timing considerations in FPGA-based designs.
- Interfacing with external hardware components, such as 7-segment LED displays.

Moving forward, this project serves as a solid foundation for exploring more complex FPGA-based projects and furthering my understanding of digital design concepts. I am excited to continue exploring FPGA development and applying my skills to future projects.

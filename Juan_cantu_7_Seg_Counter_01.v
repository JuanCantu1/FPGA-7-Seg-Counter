module Juan_cantu_7_Seg_Counter_01(
	input clock_100Mhz, // 100Mhz clock source on Basys 3 FPGA
	input reset, // reset
	output reg [7:0] Anode_Activate, // anode signals of the 7-segment LED display
	output reg [6:0] LED_out //cathode patterns of the 7-segment LED display
	);
	reg [26:0] one_second_counter; // counter for generating 1 second clock enable
	wire one_second_enable; // one second enable for counting numbers
	reg [15:0] displayed_number; // counting number to be displayed
	reg [3:0] LED_BCD;
	reg [19:0] refresh_counter;
	wire [1:0] LED_activating_counter;

	always @(posedge clock_100Mhz or posedge reset)
	begin
		if(reset==1)
			one_second_counter <=0;
		else begin
			if(one_second_counter>=99999999)
				one_second_counter <=0;
			else
				one_second_counter  <= one_second_counter  + 1;
		end
	end
	assign one_second_enable = (one_second_counter==99999999)?1:0;
	always @(posedge clock_100Mhz or posedge reset)
	begin
		if(reset==1)
			displayed_number <=0;
		else if(one_second_enable==1)
			displayed_number  <= displayed_number + 1;
	end
	always @(posedge clock_100Mhz or posedge reset)
	begin
		if(reset==1)
			refresh_counter<=0;
		else 
			refresh_counter  <= refresh_counter+ 1;
	end
	assign LED_activating_counter = refresh_counter[19:18];

	always @(*)
	begin
		case(LED_activating_counter)
		2'b00: begin
			Anode_Activate = 8'b11110111;
			LED_BCD = displayed_number/1000;
			end
		2'b01: begin
			Anode_Activate = 8'b11111011;
			LED_BCD = (displayed_number  %  1000)/100;
			end
		2'b10: begin
			Anode_Activate = 8'b11111101;
			LED_BCD = ((displayed_number % 1000)%100)/10;
			end
		2'b11: begin
			Anode_Activate = 8'b11111110;
			LED_BCD = ((displayed_number  %  1000)%100)%10;
			end
		endcase
	end



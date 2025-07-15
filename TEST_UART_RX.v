// TESTBENCH
module TEST_UART_RX;

reg clk;
reg rst;
reg TX_start;
reg [7:0] DATA_in;

wire [7:0] DATA_out;
wire parity_error;
wire stop_error;
wire op_valid;

// Instantiate the DUT (Device Under Test)
UART dut (
    .clk(clk),
    .rst(rst),
    .TX_start(TX_start),
    .DATA_in(DATA_in),
    .TX_busy(TX_busy),
    .DATA_out(DATA_out),
    .parity_error(parity_error),
    .stop_error(stop_error),
    .op_valid(op_valid)
);

// Clock generation
always #0.001 clk = ~clk;

// Task to initialize inputs
task initialize;
    begin
        clk = 0;
        rst = 0;
        DATA_in = 0;
        TX_start = 0;
    end
endtask

// Task to apply reset
task reset;
    begin
        rst = 1;
        #0.002;
        rst = 0;
    end
endtask

// Task to transmit data
task data;
    begin
        @(negedge clk);
        TX_start = 1;
        DATA_in = 8'hdd;

        // Wait for output to become valid
        @(posedge op_valid);
        @(negedge clk);

        TX_start = 1;
        DATA_in = 8'hd2;
        @(posedge op_valid);
        @(negedge clk);

        DATA_in = 8'hd0;
        @(posedge op_valid);
        DATA_in = 8'hd5;
        @(posedge op_valid);

        // End simulation after transmitting
        #12 $finish;
    end
endtask

// Initial block to run the test
initial begin
    $dumpfile("UART.vcd");
    $dumpvars;

    initialize;
    reset;
    data;
end

// Display received data
always @ (posedge op_valid)
    $strobe ("op_data=%h", DATA_out);

endmodule

module detect_start(rx_in, start_bit_detected);
    input rx_in;
    output start_bit_detected;

    assign start_bit_detected = !(rx_in);  // When input is 0, then start
endmodule

`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg din;
    wire detected;

    // Instantiate DUT
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task to send one bit
    task send_bit(input reg bit_value);
    begin
        din = bit_value;
        #10;

        $display("Time = %0t | Input = %b | Detected = %b",
                 $time, din, detected);
    end
    endtask

    initial begin
        clk = 0;
        reset = 1;
        din = 0;

        // Reset
        #10;
        reset = 0;

        $display("----- Sequence Detector Test -----");

        // Send 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Send another sequence
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Finish simulation
        #10;
        $finish;
    end

endmodule
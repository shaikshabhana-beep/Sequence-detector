module sequence_detector (
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg  detected
);

    // State definitions
    parameter IDLE = 2'b00;
    parameter S1   = 2'b01;
    parameter S10  = 2'b10;
    parameter S101 = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)

            IDLE: begin
                if (din)
                    next_state = S1;
                else
                    next_state = IDLE;
            end

            S1: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S10;
            end

            S10: begin
                if (din)
                    next_state = S101;
                else
                    next_state = IDLE;
            end

            S101: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S10;
            end

            default:
                next_state = IDLE;

        endcase
    end

    // Output logic
    always @(*) begin
        detected = 1'b0;

        // Sequence 1011 detected
        if ((state == S101) && (din == 1'b1))
            detected = 1'b1;
    end

endmodule
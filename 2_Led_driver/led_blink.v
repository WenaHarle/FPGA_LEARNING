module led_blink (
    input  wire i_clock,      // 100 MHz FPGA Clock
    input  wire i_enable,     // Enable Signal
    input  wire i_switch_1,   // Switch 1
    input  wire i_switch_2,   // Switch 2
    output reg  o_led_drive   // LED Output
);

    // Constants for frequency dividers (for 100 MHz clock)
    localparam c_CNT_100HZ = 500000;     // 100 Hz
    localparam c_CNT_50HZ  = 1000000;    // 50 Hz
    localparam c_CNT_10HZ  = 5000000;    // 10 Hz
    localparam c_CNT_1HZ   = 50000000;   // 1 Hz

    // Counter registers
    reg [26:0] r_CNT_100HZ = 0;
    reg [26:0] r_CNT_50HZ  = 0;
    reg [26:0] r_CNT_10HZ  = 0;
    reg [26:0] r_CNT_1HZ   = 0;

    // Toggle registers
    reg r_TOGGLE_100HZ = 0;
    reg r_TOGGLE_50HZ  = 0;
    reg r_TOGGLE_10HZ  = 0;
    reg r_TOGGLE_1HZ   = 0;

    // LED select wire
    wire w_LED_SELECT;

    // 100 Hz process
    always @(posedge i_clock) begin
        if (r_CNT_100HZ == c_CNT_100HZ - 1) begin
            r_TOGGLE_100HZ <= ~r_TOGGLE_100HZ;
            r_CNT_100HZ    <= 0;
        end else begin
            r_CNT_100HZ <= r_CNT_100HZ + 1;
        end
    end

    // 50 Hz process
    always @(posedge i_clock) begin
        if (r_CNT_50HZ == c_CNT_50HZ - 1) begin
            r_TOGGLE_50HZ <= ~r_TOGGLE_50HZ;
            r_CNT_50HZ    <= 0;
        end else begin
            r_CNT_50HZ <= r_CNT_50HZ + 1;
        end
    end

    // 10 Hz process
    always @(posedge i_clock) begin
        if (r_CNT_10HZ == c_CNT_10HZ - 1) begin
            r_TOGGLE_10HZ <= ~r_TOGGLE_10HZ;
            r_CNT_10HZ    <= 0;
        end else begin
            r_CNT_10HZ <= r_CNT_10HZ + 1;
        end
    end

    // 1 Hz process
    always @(posedge i_clock) begin
        if (r_CNT_1HZ == c_CNT_1HZ - 1) begin
            r_TOGGLE_1HZ <= ~r_TOGGLE_1HZ;
            r_CNT_1HZ    <= 0;
        end else begin
            r_CNT_1HZ <= r_CNT_1HZ + 1;
        end
    end

    // Mux to select the blinking frequency
    assign w_LED_SELECT = (i_switch_1 == 0 && i_switch_2 == 0) ? r_TOGGLE_100HZ :
                          (i_switch_1 == 0 && i_switch_2 == 1) ? r_TOGGLE_50HZ  :
                          (i_switch_1 == 1 && i_switch_2 == 0) ? r_TOGGLE_10HZ  :
                          r_TOGGLE_1HZ; // Default case: 1 Hz

    // LED output (only enabled when i_enable is high)
    always @(posedge i_clock) begin
        if (i_enable)
            o_led_drive <= w_LED_SELECT;
        else
            o_led_drive <= 0;
    end

endmodule


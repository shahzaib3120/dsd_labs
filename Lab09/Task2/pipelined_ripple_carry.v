module pipelined_ripple_carry(
	input clk,
	input [3:0] A,
	input [3:0] B,
	input carry_in,
	output [3:0] Sum,
	output carry_out
);

	// input delays
	reg [1:0] a1_delay;
	reg [1:0] b1_delay;

	reg [2:0] a2_delay;
	reg [2:0] b2_delay;

	reg [3:0] a3_delay;
	reg [3:0] b3_delay;

	// output delays
	reg [1:0] s3_delay;
	reg [2:0] s2_delay;
	reg [3:0] s1_delay;
	reg [4:0] s0_delay;

	// intermediate outputs
	reg [3:0] carries;
	reg [1:0] sum0, sum1, sum2, sum3;

	always @(posedge clk) begin : proc_sum0
		carries[0] = sum0[1];
		sum0 = A[0]+B[0]+carry_in;
		s0_delay[0] = sum0[0];
		s0_delay = s0_delay << 1;
	end

	always @(posedge clk) begin : proc_sum1
		carries[1] = sum0[1];
		a1_delay[0] = A[1];
		b1_delay[0] = B[1];
		sum1 = a1_delay[1]+b1_delay[1]+carries[0];
		s1_delay[0] = sum1[0];
		s1_delay = s1_delay << 1;
		a1_delay = a1_delay << 1;
		b1_delay = b1_delay << 1;
	end

	always @(posedge clk) begin : proc_sum2
		carries[2] = sum0[1];
		a2_delay[0] = A[1];
		b2_delay[0] = B[1];
		sum2 = a2_delay[2]+b2_delay[2]+carries[1];
		s2_delay[0] = sum2[0];
		s2_delay = s2_delay << 1;
		a2_delay = a2_delay << 1;
		b2_delay = b2_delay << 1;
	end

	always @(posedge clk) begin : proc_sum3
		carries[3] = sum0[1];
		a2_delay[0] = A[1];
		b2_delay[0] = B[1];
		sum3 = a3_delay[3]+b3_delay[3]+carries[2];
		s3_delay[0] = sum3[0];
		s3_delay = s3_delay << 1;
		a3_delay = a3_delay << 1;
		b3_delay = b3_delay << 1;
	end

	assign carry_out = carries[3];
	assign Sum = {s3_delay[1], s2_delay[2], s1_delay[3], s0_delay[4]};

endmodule
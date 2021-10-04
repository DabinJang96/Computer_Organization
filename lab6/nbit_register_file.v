
// This can be used to replace the original nbit_register_file in lab6.
// In iSim you can actually expand this reg_file to view the contents in it. 

module nbit_register_file(Write_Data,   // Input data
                          Read_Data_1,   // Output data 1
                          Read_Data_2,   // Output data 2
                          Read_Sel_1, // Select lines for output 1
                          Read_Sel_2, // Select lines for output 2
                          WriteSelect, // Select lines for input
                          WriteEnable, // Causes write to take place on posedge
                          rst,       // Synchronous reset
                          clk);        // Clock


 parameter data_width = 32;
 parameter select_width = 5; 
 
//Input
input           clk, WriteEnable, rst;
input           [data_width-1:0] Write_Data;
input           [4:0]  Read_Sel_1, Read_Sel_2, WriteSelect;

//Output
output		    [data_width-1:0] Read_Data_1, Read_Data_2;
    
reg             [data_width-1:0]            register_file [0:data_width-1];
    
    // for loop initializes all registers to 0, no need to rst
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin 
            register_file[i] = 10*i;
        end     
    end
    

	 assign		Read_Data_1 = register_file[Read_Sel_1];
	 assign		Read_Data_2 = register_file[Read_Sel_2];

    
    always @ (posedge clk) begin
        if (WriteEnable) 
            register_file[WriteSelect] <= Write_Data;
    end
endmodule 
module hazardunit(IFIDWrite, PCWrite, HazardMux, IDEX_rt, IFID_rs, IFID_rt, memread);
    
    //input
    input [4:0] IDEX_rt;
    input [4:0] IFID_rs;
    input [4:0] IFID_rt;
    input memread;
    
    //output
    output IFIDWrite;
    output PCWrite;
    output HazardMux;
    
    assign IFIDWrite = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 0 : 1;
    assign PCWrite = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 0 : 1;
    assign HazardMux = (memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) ? 1 : 0; 
    


//    input [4:0] ReadReg1, ReadReg2;
//    input [4:0] RegDestMuxOut;
//    input [4:0] MemDest;
//    input IDEX_WBControl;
//    input MEM_RegWrite;
    
    
////    wire IDEX_RegWrite;
////    assign IDEX_RegWrite = IDEX_WBControl[0];

//	output reg IFIDWrite, PCWrite, HazardMux;
	
//	always@(*)
//	begin
//	   if(IDEX_WBControl == 1 && RegDestMuxOut != 0 && ((RegDestMuxOut == ReadReg1) || (RegDestMuxOut == ReadReg2)))
//	       begin
//	           IFIDWrite = 0;
//	           PCWrite = 0;
//	           HazardMux = 1;
//	       end
//	   else if (MEM_RegWrite == 1 && MemDest != 0 && ((MemDest == ReadReg1) || (MemDest == ReadReg2)))
//	       begin
//	           IFIDWrite = 0;
//	           PCWrite = 0;
//	           HazardMux = 1;
//	       end
//	   else
//	   begin
//	           IFIDWrite = 1;
//	           PCWrite = 1;
//	           HazardMux = 0;
//	   end
//     end
endmodule

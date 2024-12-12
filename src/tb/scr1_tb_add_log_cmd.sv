module scr1_tb_add_log_cmd ();
    always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) begin
        if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) begin
            if (
                (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b0110011) &
                (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b000)) begin
                    // detect and command
                    $display(
                        "Detect ADD command, rs1 = %h, rs2 = %h \n",
                        scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_pipe_mprf.mprf_int[scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[19 : 15]],
                        scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_pipe_mprf.mprf_int[scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[25 : 20]]);
            end
        end
    end
endmodule
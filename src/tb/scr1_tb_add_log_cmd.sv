module scr1_tb_add_log_cmd ();
    always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) begin
        if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) begin
            if (
                (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b0010011) &
                (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b000)) begin
                    // detect and command
                    $display(
                        "Detect ADD command, PC = %h, imem_req = %h, imem_addr = %h, imem_resp = %h, imem_rdata = %h \n",
                        scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc,
                        scr1_top_tb_ahb.i_top.i_imem_ahb.imem_req,
                        scr1_top_tb_ahb.i_top.i_imem_ahb.imem_addr,
                        scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp,
                        scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata);
            end
        end
    end
endmodule
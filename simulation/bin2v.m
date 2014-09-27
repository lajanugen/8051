fid = fopen('sim2.bin');
A = [dec2hex(fread(fid))];
fclose(fid);
fid = fopen('ROM.v','w');
fprintf(fid,'`timescale 1ns / 1ps\n\nmodule ROM(\n\tinput clk,\n\tinput [13:0] addr0,\n\tinput [13:0] addr1,\n\tinput [13:0] addr2,\n\tinput [13:0] addr3,\n\toutput reg [7:0] data0,\n\toutput reg [7:0] data1,\n\toutput reg [7:0] data2,\n\toutput reg [7:0] data3\n\t);\n\n//Bank 0\nalways @(*)\n\tcase (addr0)\n');
addr = 0;
for i=1:4:size(A,1)
   fprintf(fid,['\t\t13''h' dec2hex(addr) ': data0 = 8''h' A(i,:) ';\n']); 
   addr = addr + 1;
end
fprintf(fid,'\t\tdefault: data0 = 8''h00;\n\tendcase\n\n//Bank 1\nalways @(*)\n\tcase (addr1)\n');
addr = 0;
for i=2:4:size(A,1)
   fprintf(fid,['\t\t13''h' dec2hex(addr) ': data1 = 8''h' A(i,:) ';\n']); 
   addr = addr + 1;
end
fprintf(fid,'\t\tdefault: data1 = 8''h00;\n\tendcase\n\n//Bank 2\nalways @(*)\n\tcase (addr2)\n');
addr = 0;
for i=3:4:size(A,1)
   fprintf(fid,['\t\t13''h' dec2hex(addr) ': data2 = 8''h' A(i,:) ';\n']); 
   addr = addr + 1;
end
fprintf(fid,'\t\tdefault: data2 = 8''h00;\n\tendcase\n\n//Bank 3\nalways @(*)\n\tcase (addr3)\n');
addr = 0;
for i=4:4:size(A,1)
   fprintf(fid,['\t\t13''h' dec2hex(addr) ': data3 = 8''h' A(i,:) ';\n']); 
   addr = addr + 1;
end
fprintf(fid,'\t\tdefault: data3 = 8''h00;\n\tendcase\n\nendmodule\n');
fclose(fid);

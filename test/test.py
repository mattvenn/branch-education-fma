import cocotb
from cocotb.triggers import Timer

WIDTH=4

@cocotb.test()
async def test(dut):
    max_value = 2**WIDTH-1
    # test a range of values
    for a in range(0, max_value):
        for b in range(0, max_value):
            for c in range(0, max_value):

                dut.a.value = a
                dut.b.value = b
                dut.c.value = c

                await Timer(2, units="ns")
                assert(dut.out == a * b + c)
    

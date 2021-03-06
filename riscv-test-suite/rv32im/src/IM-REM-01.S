# RISC-V Compliance Test IM-REM-01
#
# Copyright (c) 2018, Imperas Software Ltd.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the Imperas Software Ltd. nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Imperas Software Ltd. BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Specification: RV32IM Base Integer Instruction Set, Version 2.0
# Description: Testing instruction REM.

#include "compliance_test.h"
#include "compliance_io.h"

# Test Virtual Machine (TVM) used by program.
RV_COMPLIANCE_RV32M

# Test code region.
RV_COMPLIANCE_CODE_BEGIN

    RVTEST_IO_INIT
    RVTEST_IO_ASSERT_EQ(x0, 0x00000000)
    RVTEST_IO_WRITE_STR("# Test Begin Reserved regs ra(x1) a0(x10) t0(x5)\n")

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part A1 - general test of value 0 with 0, 1, -1, MIN, MAX register values\n");

    # addresses for test data and results
    la      x1, test_A1_data
    la      x2, test_A1_res

    # Load testdata
    lw      x3, 0(x1)

    # Register initialization
    li      x4, 0
    li      x5, 1
    li      x6, -1
    li      x7, 0x7FFFFFFF
    li      x8, 0x80000000

    # Test
    rem     x4, x3, x4
    rem     x5, x3, x5
    rem     x6, x3, x6
    rem     x7, x3, x7
    rem     x8, x3, x8

    # Store results
    sw      x3, 0(x2)
    sw      x4, 4(x2)
    sw      x5, 8(x2)
    sw      x6, 12(x2)
    sw      x7, 16(x2)
    sw      x8, 20(x2)

    //
    // Assert
    //
    RVTEST_IO_CHECK()
    RVTEST_IO_ASSERT_EQ(x3, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x4, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x5, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x6, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x7, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x8, 0x00000000)

    RVTEST_IO_WRITE_STR("# Test part A1  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part A2 - general test of value 1 with 0, 1, -1, MIN, MAX register values\n");

    # addresses for test data and results
    la      x1, test_A2_data
    la      x2, test_A2_res

    # Load testdata
    lw      x8, 0(x1)

    # Register initialization
    li      x9, 0
    li      x11, 1
    li      x12, -1
    li      x13, 0x7FFFFFFF
    li      x14, 0x80000000

    # Test
    rem     x9, x8, x9
    rem     x11, x8, x11
    rem     x12, x8, x12
    rem     x13, x8, x13
    rem     x14, x8, x14

    # Store results
    sw      x8, 0(x2)
    sw      x9, 4(x2)
    sw      x11, 8(x2)
    sw      x12, 12(x2)
    sw      x13, 16(x2)
    sw      x14, 20(x2)

    RVTEST_IO_ASSERT_EQ(x8, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x9, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x11, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x12, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x13, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x14, 0x00000001)

    RVTEST_IO_WRITE_STR("# Test part A2  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part A3 - general test of value -1 with 0, 1, -1, MIN, MAX register values\n");

    # addresses for test data and results
    la      x1, test_A3_data
    la      x2, test_A3_res

    # Load testdata
    lw      x13, 0(x1)

    # Register initialization
    li      x14, 0
    li      x15, 1
    li      x16, -1
    li      x17, 0x7FFFFFFF
    li      x18, 0x80000000

    # Test
    rem     x14, x13, x14
    rem     x15, x13, x15
    rem     x16, x13, x16
    rem     x17, x13, x17
    rem     x18, x13, x18

    # Store results
    sw      x13, 0(x2)
    sw      x14, 4(x2)
    sw      x15, 8(x2)
    sw      x16, 12(x2)
    sw      x17, 16(x2)
    sw      x18, 20(x2)

    RVTEST_IO_ASSERT_EQ(x13, 0xFFFFFFFF)
    RVTEST_IO_ASSERT_EQ(x14, 0xFFFFFFFF)
    RVTEST_IO_ASSERT_EQ(x15, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x16, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x17, 0xFFFFFFFF)
    RVTEST_IO_ASSERT_EQ(x18, 0xFFFFFFFF)

    RVTEST_IO_WRITE_STR("# Test part A3  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part A4 - general test of value 0x7FFFFFFF with 0, 1, -1, MIN, MAX register values\n");

    # addresses for test data and results
    la      x1, test_A4_data
    la      x2, test_A4_res

    # Load testdata
    lw      x18, 0(x1)

    # Register initialization
    li      x19, 0
    li      x20, 1
    li      x21, -1
    li      x22, 0x7FFFFFFF
    li      x23, 0x80000000

    # Test execution
    rem     x19, x18, x19
    rem     x20, x18, x20
    rem     x21, x18, x21
    rem     x22, x18, x22
    rem     x23, x18, x23

    # Store results
    sw      x18, 0(x2)
    sw      x19, 4(x2)
    sw      x20, 8(x2)
    sw      x21, 12(x2)
    sw      x22, 16(x2)
    sw      x23, 20(x2)

    RVTEST_IO_ASSERT_EQ(x18, 0x7FFFFFFF)
    RVTEST_IO_ASSERT_EQ(x19, 0x7FFFFFFF)
    RVTEST_IO_ASSERT_EQ(x20, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x21, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x22, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x23, 0x7FFFFFFF)

    RVTEST_IO_WRITE_STR("# Test part A4  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part A5 - general test of value 0x80000000 with 0, 1, -1, MIN, MAX register values\n");

    # addresses for test data and results
    la      x1, test_A5_data
    la      x2, test_A5_res

    # Load testdata
    lw      x23, 0(x1)

    # Register initialization
    li      x24, 0
    li      x25, 1
    li      x26, -1
    li      x27, 0x7FFFFFFF
    li      x28, 0x80000000

    # Test
    rem     x24, x23, x24
    rem     x25, x23, x25
    rem     x26, x23, x26
    rem     x27, x23, x27
    rem     x28, x23, x28

    # Store results
    sw      x23, 0(x2)
    sw      x24, 4(x2)
    sw      x25, 8(x2)
    sw      x26, 12(x2)
    sw      x27, 16(x2)
    sw      x28, 20(x2)

    RVTEST_IO_ASSERT_EQ(x23, 0x80000000)
    RVTEST_IO_ASSERT_EQ(x24, 0x80000000)
    RVTEST_IO_ASSERT_EQ(x25, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x26, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x27, 0xFFFFFFFF)
    RVTEST_IO_ASSERT_EQ(x28, 0x00000000)

    RVTEST_IO_WRITE_STR("# Test part A5  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part B - testing forwarding between instructions\n");

    # addresses for test data and results
    la      x25, test_B_data
    la      x26, test_B_res

    # Load testdata
    lw      x28, 0(x25)

    # Register initialization
    li      x27, 0x2

    # Test
    rem     x29, x28, x27
    rem     x30, x29, x27
    rem     x31, x30, x27
    rem     x2, x31, x27
    rem     x3, x2, x27
    rem     x4, x3, x27

    # store results
    sw      x27, 0(x26)
    sw      x28, 4(x26)
    sw      x29, 8(x26)
    sw      x30, 12(x26)
    sw      x31, 16(x26)
    sw      x2, 20(x26)
    sw      x3, 24(x26)
    sw      x4, 28(x26)

    RVTEST_IO_ASSERT_EQ(x27, 0x00000002)
    RVTEST_IO_ASSERT_EQ(x28, 0x0000ABCD)
    RVTEST_IO_ASSERT_EQ(x29, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x30, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x31, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x2, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x3, 0x00000001)
    RVTEST_IO_ASSERT_EQ(x4, 0x00000001)

    RVTEST_IO_WRITE_STR("# Test part B  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part C - testing writing to x0\n");

    # addresses for test data and results
    la      x1, test_C_data
    la      x2, test_C_res

    # Load testdata
    lw      x28, 0(x1)

    # Register initialization
    li      x27, 0xF7FF8818

    # Test
    rem     x0, x28, x27

    # store results
    sw      x0, 0(x2)

    RVTEST_IO_ASSERT_EQ(x0, 0x00000000)

    RVTEST_IO_WRITE_STR("# Test part C  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part D - testing forwarding throught x0\n");

    # addresses for test data and results
    la      x1, test_D_data
    la      x2, test_D_res

    # Load testdata
    lw      x28, 0(x1)

    # Register initialization
    li      x27, 0xF7FF8818

    # Test
    rem     x0, x28, x27
    rem     x5, x0, x0

    # store results
    sw      x0, 0(x2)
    sw      x5, 4(x2)


    RVTEST_IO_ASSERT_EQ(x0, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x5, 0x00000000)

    RVTEST_IO_WRITE_STR("# Test part D  - Complete\n");

    # ---------------------------------------------------------------------------------------------
    RVTEST_IO_WRITE_STR("# Test part E - testing moving (rem with x0)\n");

    # addresses for test data and results
    la      x1, test_E_data
    la      x2, test_E_res

    # Load testdata
    lw      x3, 0(x1)

    # Test
    rem     x4, x3, x0
    rem     x5, x4, x0
    rem     x6, x0, x5
    rem     x14, x6, x0
    rem     x15, x14, x0
    rem     x16, x15, x0
    rem     x25, x0, x16
    rem     x26, x0, x25
    rem     x27, x26, x0

    # Store results
    sw      x4, 0(x2)
    sw      x26, 4(x2)
    sw      x27, 8(x2)

    RVTEST_IO_ASSERT_EQ(x4, 0x36925814)
    RVTEST_IO_ASSERT_EQ(x26, 0x00000000)
    RVTEST_IO_ASSERT_EQ(x27, 0x00000000)

    RVTEST_IO_WRITE_STR("# Test part E  - Complete\n");

    RVTEST_IO_WRITE_STR("# Test End\n")

 # ---------------------------------------------------------------------------------------------
    # HALT
    RV_COMPLIANCE_HALT

RV_COMPLIANCE_CODE_END

# Input data section.
    .data

test_A1_data:
    .word 0
test_A2_data:
    .word 1
test_A3_data:
    .word -1
test_A4_data:
    .word 0x7FFFFFFF
test_A5_data:
    .word 0x80000000
test_B_data:
    .word 0x0000ABCD
test_C_data:
    .word 0x12345678
test_D_data:
    .word 0xFEDCBA98
test_E_data:
    .word 0x36925814

# Output data section.
RV_COMPLIANCE_DATA_BEGIN

test_A1_res:
    .fill 6, 4, -1
test_A2_res:
    .fill 6, 4, -1
test_A3_res:
    .fill 6, 4, -1
test_A4_res:
    .fill 6, 4, -1
test_A5_res:
    .fill 6, 4, -1
test_B_res:
    .fill 8, 4, -1
test_C_res:
    .fill 1, 4, -1
test_D_res:
    .fill 2, 4, -1
test_E_res:
    .fill 3, 4, -1

RV_COMPLIANCE_DATA_END

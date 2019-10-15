---
title: "Dr. Durant: CS-280 Embedded Systems Software: Course Outline (Spring 2006)"
---

You will need to keep track of the time you spend each week on the lab
assignments and enter it in the FAST system.
The FAST system is only available on campus or via MSOE's VPN.
Your student ID number is your initial password. FAST provides
both you and me with easy access to your time summary information. You are
encouraged to enter your times regularly, but they will be checked when
labs 4 and 7 are graded.

<table border>
<tr>
    <th>Week</th>
    <th>Day</th>
    <th>Topics</th>
    <th>Lab</th>
</tr>

<tr>
    <td rowspan="3" align="center">1<br>6-10 March</td>
    <td align="center">M</td>
    <td><a href="cs280-01.pdf">Introduction, number systems</a>
        <br/><a href="circlesBy16.pdf">2's complement exercises</a></td>
    <td rowspan="3" align="center"><a href="lab1.html">Lab 1: Wookie/WinBug11</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-02.pdf">Microcontroller components, tool introduction</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td><a href="cs280-03.pdf">Tool chain and programmer's model (Registers)</a></td>
</tr>

<tr>
    <td rowspan="3" align="center">2<br>13-17 March</td>
    <td align="center">M</td>
    <td><a href="cs280-04.pdf">Addressing, CCR</a></td>
    <td rowspan="3" align="center"><a href="lab2.html">Lab 2: Bouncing light</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="led-demo.s">Flashin' LED Demo</a>
        <br><a href="cs280-05.pdf">Tools: Assembler, linker, simulator</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td><a href="cs280-06.pdf">Instruction set introduction: transfers, load/store, add/subtract</a>
	<br/><a href="lec6.s">Example program</a></td>
</tr>

<tr>
    <td rowspan="3" align="center">3<br>20-24 March</td>
    <td align="center">M</td>
    <td>Data members and member functions in assembly:
        class-demo.cpp,
        class-demo-s.s</td>
    <td rowspan="3" align="center"><a href="lab3.html">Lab 3: Scrolling message</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-08.pdf">Display // Instruction set: multiply/divide, flags, shift/rotate</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td><a href="cs280-09.pdf">Instruction set: bit/logic, branches</a>
        <br/><a href="cmp.s">Sample program</a></td>
</tr>

<tr>
    <td rowspan="3" align="center">4<br>27-31 March</td>
    <td align="center">M</td>
    <td><a href="quiz3ans-s03.pdf">Quiz 3 Solution from 2003</a>
        <br/><a href="cs280-10.pdf">Decimal arithmetic / Keypad</a></td>
    <td rowspan="6" align="center"><a href="lab4.html">Lab 4: Adding machine</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-11.pdf">Instruction set: subroutines, stacks</a>
      <br/><a href="poly.s">Demo program, polynomial calculation</a>, <a href="oge.s">Demo program, local variables on the stack</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td>Review for test 1 / <a
        href="objectives.pdf">Detailed lesson objectives</a> 1-10</td>
</tr>

<tr>
    <td rowspan="3" align="center">5<br>3-7 April</td>
    <td align="center">M</td>
    <td><strong>Test 1</strong></td>
</tr>
<tr>
    <td align="center">W</td>
    <td>Review Test 1 / Catch-up / Sample problems</td>
</tr>
<tr>
    <td align="center">F</td>
    <td><a href="cs280-12.pdf">C++ review/compiler</a>
        / hello.cpp Demo - briefcase/Wookie
        <br/>helloFox.cpp Demo - Fox11,
        <a href="ports_fox11.h">ports_fox11.h</a>,
        <a href="ports_fox11.s">ports_fox11.s</a></td>
</tr>

<tr>
    <td rowspan="3" align="center">6<br>10-14 April</td>
    <td align="center">M</td>
    <td><a href="cs280-13.pdf">ASM vs. C++ structure,
        argument passing, inline asm</a>
        <br/><a href="passing.html">Argument passing in GCC 3.0.4</a>,
        <br/>Basic name mangler example,
        <br/>Extern ASM variable example: extern_c.cpp,
            extern_a.s</td>
    <td rowspan="7" align="center"><a href="lab5.html">Lab 5: Mixing C++/ASM</a></td> <!-- 7 to span spring break marker -->
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-14.pdf">Parallel I/O</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td><em>First day of Spring Break</em></td>
</tr>

<tr>
    <th colspan="3" align="center">Spring Break</td>
</tr>

<tr>
    <td rowspan="3" align="center">7<br>24-28 April</td>
    <td align="center">M</td>
    <td><a href="cs280-15.pdf">Parallel I/O: Handshaking</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-16.pdf">A/D</a>
        <br/><a href="adHnds.s">Handshaking with external A/D chip</a></td>
</tr>
<tr>
    <td align="center">F</td>
    <td>A/D and integer scaling
        <br/>Optional material: <a href="cs280-17.pdf">A/D internals</a></td>
</tr>

<tr>
    <td rowspan="3" align="center">8<br>1-5 May</td>
    <td align="center">M</td>
    <td>Review for test 2 /
        <a href="objectives.pdf">Detailed lesson objectives</a> 1-16</td>
    <td rowspan="3" align="center"><a href="lab6.html">Lab 6: A/D</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><strong>Test 2</strong></td>
</tr>
<tr>
    <td align="center">F</td>
    <td>Review Test 2 / Catch-up</td>
</tr>

<tr>
    <td rowspan="3" align="center">9<br>8-12 May</td>
    <td align="center">M</td>
    <td><a href="cs280-18.pdf">Interrupts</a>
      <br/>os.s - C++ interrupt support
    </td>
    <td rowspan="6" align="center"><a href="lab7.html">Lab 7: Interrupts</a>
        <br/><a href="tcnt.xls">TCNT offset calculations (Excel)</a></td>
</tr>
<tr>
    <td align="center">W</td>
    <td><a href="cs280-19.pdf">Real-time interrupt (RTI) / Demo</a>
      <br/>rti.s, rti2.cpp</td>
</tr>
<tr>
    <td align="center">F</td>
    <td>Timer input capture (TIC) (no online notes)
      <br/>ic3w.s</td>
</tr>

<tr>
    <td rowspan="3" align="center">10<br>15-19 May</td>
    <td align="center">M</td>
    <td>Additional Topic</td><!-- Pulse Accumulator? SPI/SCI? -->
</tr>
<tr>
    <td align="center">W</td>
    <td>Catch-up</td>
</tr>
<tr>
    <td align="center">F</td>
    <td>Review for final</td>
</tr>

<tr>
    <td rowspan="3" align="center">11<br>22-26 May</td>
    <td align="center">W</td>
    <td colspan="3"><strong>Common Final Exam</strong>: 11:00 A.M. - 1:00 P.M. in CC-51</td>
</tr>

</table>

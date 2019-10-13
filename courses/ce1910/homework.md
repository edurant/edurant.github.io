---
title: "Dr. Durant: CE-1910: Optional Homework"
---

Homework is __optional__ in CE-1910 and will not be collected or graded. Homework is provided for students who wish to have additional review of the material in preparation for quizzes. Students are encouraged to ask questions about homework in lecture, lab, during office hours, and via email.

Abbreviation of dates: WmDn refers to the nth day of lecture in the mth week of class. WmL refers to the lab in week m. For example, W3D2 is the 2nd lecture
of week 3 (regardless of whether the lab period is before or after the 2nd lecture period). 

## W1D1
* (4 points) Draw a truth table for the digital logic circuit below, being sure to include the values of intermediate signals M and N.<br/>[W1D1 Figure 1](w1d1figure.png)
* (3 points) Draw the K-maps for the functions F and G that you enumerated above. Use the K-maps to find the minimum SOP expressions for F and G.
* (3 points) Draw logic circuits for F and G in SOP form based on your K-map expressions.

## W1D2
* Create a Quartus project with a toplevel entity called DLE (for D-latch with enable). Create a schematic BDF file that implements a DLE using NAND and NOT gates; your inputs will be D and E and your outputs will be Q and QN. Simulate this with random input values, except that E should be 0 at the beginning of the simulation. You should continue to use the functional (not timing) simulator mode that you used in CE1900. Submit the following...
  * (4 points) A printout of your schematic file. Be sure to use the schematic annotation tool (click the "A" icon on the schematic editor toolbar) to include your name, class, and date on your schematic.
  * (6 points) A printout of your simulation output showing interesting behavior. You should annotate this printout by hand, explaining why several output values are correct given the inputs and prior state.

## W2D1
* (5 points) A DFF with enable and asynchronous clear is available in Quartus. Create a Quartus project with a block diagram top-level file. Add the "DFFE" component, connecting the PRN active low input to a constant logic 1 (component name VCC). Create all the other DFFE inputs and outputs to input and output objects respectively. Simulate it using the waveform below (it may be easiest to slow down the time scale by a factor of two since the waveform editor by default allows changes in 10 ns and larger intervals (not 5 ns intervals)).<br/>[W2D1 Figure](w2d1figure.png)
* (5 points) Explain the simulation, noting why each transition meets your expectations.

## W3D1
* (10 points) P7.3(a) (page 270): Begin by drawing the given state diagram. Then draw the state table, letting the 2 bits in the state names correspond to
  Q1 (MSB) and Q0 (LSB). Next, derive the excitation equations using K-maps. Draw the state machine using logic symbols.
* (10 points) P7.1(a) (page 265): Draw the given circuit (by hand or using software), write the excitation equations,
  complete the next state table, and draw the state diagram.
* (5 points, extra credit, optional) Simulate *both* circuits and confirm/illustrate that 7.1(a) behaves as you calculated and that
  the 7.3(a) behaves as specified by the given state diagram.

## W4D2
* (10 points) P7.12 (page 272): Do everything except draw the circuit (drawing the circuit is optional; you
  will write the VHDL in the next problem).
* (10 points) Implement and simulate the circuit using __structural/dataflow__ VHDL. Your simulation must show both the
  counting and the stopped behavior.

## W5D1
* (4 points) Draw the state diagram for a 7-value up/down (by 1) counter that moves by one state on a clock transition among S0 through S6. The signal UP will be asserted high when the counter is to count up. Counting down from S0 will leave the machine in S0. Counting up from S6 will leave it in S6. Illustrate __BOTH__ Gray and direct encoding of states on your diagram.
* (6 points) Draw the design state table for both encodings, including next state and excitation values for __T flip flops__. Use don't cares for transitions from the unused states. Note that the unused state will depend upon the encoding.
* (4 points) Draw all the needed K-maps for each machine and state the most reduced SOP expressions for the next state logic.
* (3 points) Discuss whether and how direct vs. Gray encoding offers an advantage if implementing the next-state logic in minimized SOP form using 7400-series chips.
* (3 points) Discuss whether and how direct vs. Gray encoding offers an advantage if implementing the next-state logic in a PLD.
* (2 points, extra credit, optional) Discuss whether and how direct vs. Gray encoding offers an advantage if implementing the next-state logic in a full-custom VLSI design. (A full-custom design means that individual logic gates, made out of transistors, are laid out on the chip in a way that can be highly optimized for the particular circuit.)
* (3 points, extra credit, optional) Implement either circuit in Quartus (use any method: schematic or VHDL) and simulate it, verifying correct behavior.

## W7D1
* Draw a digital logic circuit diagram (you may use Quartus, but a hand drawing is recommended) for a modified modulo-7 counter that loops back to 2 after reaching its maximum value. If the counter ever gets into the 0 or 1 state, it should simply count up. Thus, a valid sequence is 0, 1, 2, 3, ..., MaxValue, 2, 3, ..., MaxValue, 2, 3, ... You may use: any type of DFF, any basic logic gate, (AND, OR, XOR, ...), half adders, and MUXes. In addition to your class notes, you may want to review section 8.3 of the textbook, especially section 8.3.1.

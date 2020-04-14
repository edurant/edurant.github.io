---
title: "Dr. Durant: CE-1921 Computer Architecture"
---

* [Main website including textbook information, lab assignments, course-specific policies, and daily learning objectives](https://faculty-web.msoe.edu/meier/ce1921/)
* [Policies](../policies.html)
* [ARMSim#&ndash;ARM assembly language execution simulator](https://webhome.cs.uvic.ca/~nigelh/ARMSim-V2.1/)
* [ARM Instruction Format Quick Reference](armInstructionFormat.pdf)
* [VHDL review sheet](../ce1901/vhdlSummary.pdf)
* Online tools
  * [dissembler.io Online disassembler](https://www.onlinedisassembler.com/) - select armv4, enter machine code (use big endian mode), get assembly code
  * [armconverter.com Online assembler](http://armconverter.com/)
  * [Alternate Online Assembler and Disassembler](http://shell-storm.org/online/Online-Assembler-and-Disassembler/)
* The architectures from ARMv4T to ARMv7-A are 32-bit (register/operand and address size), similar to the ARMv4 in our textbook.
    But, these architectures *additionally* support a (mostly) 16-bit *Thumb* encoding that is (mostly) a subset of ARM.
    This requires additional *decode* hardware but otherwise uses the same (e.g., pipelined) microarchitecture.
    * Reference: [ARM7TDMI Data Sheet: Chapter 5: THUMB Instruction Set](ARM7-TDMI-ch5.pdf)
    * [Thumb version of DE10-Lite lab assembly program](thumbV1.s)

## Additional readings

### 2020
* England, Rachel. [An algorithm could make CPUs a cheap way to train AI](https://www.engadget.com/2020/03/03/rice-university-slide-cpu-gpu-machine-learning/). *engadget*, 3 March 2020. [discussed 2020-03-09]
* Fitch, Asa and Bob Davis. [U.S. Chip Industry Fears Long-Term Damage From China Trade Fight](https://www.wsj.com/articles/chip-industry-fears-damage-china-trade-fight-11583693926). *Wall Street Journal*, 9 March 2020.
* Isaacson, Walter. [The Innovators](https://en.wikipedia.org/wiki/The_Innovators_(book)). Simon & Schuster, 7 October 2014. (This is an outstanding book about computer engineering, telling the story of how engineers and scientists invented each technology (digital logic, transistor, integrated circuit, fixed-purpose computer, stored-program computer, packet-switched network, etc.) on the road to today's computing systems.)

### 2018
* ___. <a href="https://developer.arm.com/products/processors/machine-learning/arm-ml-processor">Arm Machine Learning Processor</a>.
  <cite>arm Developer</cite>, retrieved 28 March 2018.
* ___. <a href="https://www.ibm.com/blogs/research/2017/10/ibm-scientists-demonstrate-memory-computing-1-million-devices-applications-ai/">IBM Scientists Demonstrate In-memory Computing with 1 Million Devices for Applications in AI</a>.
  <cite>IBM Research Blog</cite>, 24 October 2017.
* ___. <a href="https://globenewswire.com/news-release/2018/02/22/1379991/0/en/STMicroelectronics-Powers-Next-Generation-IoT-Devices-with-Higher-Performing-Multiprotocol-Bluetooth-802-15-4-System-on-Chip.html">STMicroelectronics Powers Next-Generation IoT Devices with Higher-Performing Multiprotocol Bluetooth &amp; 802.15.4 System-on-Chip</a>.
  <cite>STMicroelectronics</cite>, 22 February 2018.
* Gallagher, Dan. <a href="https://www.wsj.com/articles/chip-makers-are-better-off-without-crypto-miners-1523611801">Chip Makers Are Better off Without Crypto Miners</a>.
  <cite>The Wall Street Journal</cite>, 13 April 2018.
* Hardawar, Devindra. <a href="https://www.engadget.com/2018/03/27/nvidia-arm-ai-iot/">NVIDIA's next AI steps: An ARM deal and a new 'personal supercomputer'</a>.
  <cite>engadget</cite>, 27 March 2018.
* Lucky, Robert. <a href="https://spectrum.ieee.org/at-work/innovation/engineering-in-the-twilight-of-moores-law">Engineering in the Twilight of Moore&rsquo;s Law</a>.
  <cite>IEEE Spectrum</cite>, 21 February 2018.
* Metz, Cade. <a href="https://www.nytimes.com/2018/03/21/technology/computer-chips-turing-award.html">Chip Design Visionaries Share Turing Award</a>.
  <cite>New York Times</cite>, 22 March 2018.
* Mims, Christopher. <a href="https://www.wsj.com/articles/in-self-driving-car-road-test-we-are-the-guinea-pigs-1526212802">Drivers Become Guinea Pigs</a>.
  <cite>The Wall Street Journal</cite>, 14 May 2018.
* Roose, Kevin. <a href="https://www.nytimes.com/2018/05/11/technology/kevins-week-in-tech-are-googles-ai-powered-phone-calls-cool-creepy-or-both.html">Critics Say Google&rsquo;s A.I. Phone Calls Have Everything, Except Ethics</a>.
  <cite>New York Times</cite>, 14 May 2018.
* Sigler, Karl. <a href="https://www.trustwave.com/Resources/SpiderLabs-Blog/Overview-of-Meltdown-and-Spectre/">Overview of Meltdown and Spectre</a>.
  <cite>Trustwave</cite>, 4 January 2018.

### 2017
* Bourzac, Katherine. <a href="http://spectrum.ieee.org/semiconductors/materials/graphene-could-buttress-nextgen-computer-chip-wiring">Graphene Could Buttress Next-Gen Computer Chip Wiring</a>.
  <cite>IEEE Spectrum</cite>, 17 February 2017.
* Clancy, Kelly. <a href="http://www.newyorker.com/tech/elements/a-computer-to-rival-the-brain">A computer to rival the brain</a>.
  <cite>The New Yorker</cite>, 15 February 2017.
* Courtland, Rachel. <a href="http://spectrum.ieee.org/nanoclast/semiconductors/processors/xray-ic-imaging">X-rays Map the 3D Interior of Integrated Circuits</a>.
  <cite>IEEE Spectrum</cite>, 17 March 2017.
* Gallagher, Dan. <a href="https://www.wsj.com/articles/the-chip-stocks-that-dont-need-a-smartphone-supercycle-1491494579">The Chip Stocks That Don't Need a Smartphone Supercycle</a>.
  <cite>The Wall Street Journal</cite>, 7 April 2017.
* Greenwald, Ted. <a href="https://www.wsj.com/articles/new-intel-technology-bridges-gap-between-speedy-conventional-memory-longer-term-storage-1489917600">New Intel Technology Bridges Gap Between Speedy Conventional Memory, Longer-Term Storage</a>.
  <cite>The Wall Street Journal</cite>, 19 March 2017.
* Mims, Christopher. <a href="https://www.wsj.com/articles/how-chip-designers-are-breaking-moores-law-1489924804">How Chip Designers Are Breaking Moore&rsquo;s Law</a>.
  <cite>The Wall Street Journal</cite>, 19 March 2017.
* Pareles, Jon. <a href="https://www.nytimes.com/2017/04/03/arts/music/ikutaro-kakeshashi-roland-808-drum-machine-dead.html">Ikutaro Kakehashi, Whose Gadget Reshaped Music's Beat, Dies at 87</a>.
  <cite>New York Times</cite> 5 April 2017.
* Scott, Mark. <a href="https://www.nytimes.com/2017/03/13/business/dealbook/intel-mobileye-autonomous-cars-israel.html?_r=0">Intel Moves in On Car Market with Takeover</a>.
  <cite>New York Times</cite>, 13 March 2017.
* Tehranipoor, Mark M., Ujjwal Guin, and Swarup Bhunia. <a href="http://spectrum.ieee.org/computing/hardware/invasion-of-the-hardware-snatchers-cloned-electronics-pollute-the-market">Invasion of the Hardware Snatchers: Cloned Electronics Pollute the Market</a>.
  <cite>IEEE Spectrum</cite>, 24 April 2017.
* Tufecki, Zeynep. <a href="https://www.nytimes.com/2017/05/13/opinion/the-world-is-getting-hacked-why-dont-we-do-more-to-stop-it.html">The World Is Getting Hacked. Why Don't We Do More to Stop It?</a>
  <cite>New York Times</cite>, 13 May 2017.
* V&#228;tt&#246;, Kristian, Ian Cutress &amp; Ryan Smith. <a href="http://www.anandtech.com/show/9470/intel-and-micron-announce-3d-xpoint-nonvolatile-memory-technology-1000x-higher-performance-endurance-than-nand">Analyzing Intel-Micron 3D XPoint: The Next Generation Non-Volatile Memory</a>.
  <cite>AnandTech</cite>, 31 July 2015.

### 2016
* _____. <a href="http://www.economist.com/technology-quarterly/2016-03-12/after-moores-law">After Moore's Law: Double, double, toil and trouble</a>.
  <cite>The Economist</cite>, 12 March 2016. (Distributed 2016-03-14)
* Dent, Steve. <a href="http://www.engadget.com/2016/03/23/intel-eliminating-tick-tock-moores-law/">Intel is officially slowing down the pace of CPU releases</a>.
  <cite>engadget</cite>, 23 March 2016. (Distributed 2016-03-23/24)
* Luebke, D. and G. Humphreys. <a href="http://ieeexplore.ieee.org/xpl/abstractSimilar.jsp?arnumber=4085637">How GPUs Work</a>.
  <cite>IEEE Computer</cite>, 12 February 2007. (Distributed 2016-04-10)
* Shilov, Anton. <a href="http://www.anandtech.com/show/10256/intel-unveils-apollo-lake-14nm-goldmont">Intel
  Unveils New Low-Cost PC Platform: Apollo Lake with 14nm Goldmont Cores</a>.
  <cite>AnandTech</cite>, 15 April 2016. (Distributed 2016-04-19)

### 2011
* Kogge, Peter.
    <a href="http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=05693074">The tops in flops</a>.
     <cite>IEEE Spectrum</cite>, February 2011.<!--bottlenecks: memory/cache, power, power efficiency-->
* Schow, Clint et al.
    <a href="http://spectrum.ieee.org/semiconductors/optoelectronics/get-on-the-optical-bus">Get on the Optical Bus</a>.
     <cite>IEEE Spectrum</cite>, September 2010.<!--intro memory bottleneck, electronic signal speeds, good intro-->
* Anderson, Mark.
    <a href="http://spectrum.ieee.org/computing/hardware/better-benchmarking-for-supercomputers">Better Benchmarking for Supercomputers</a>.
     <cite>IEEE Spectrum</cite>, January 2011.<!--benchmarking: what is useful-->
* Moore, Samuel K.
    <a href="http://spectrum.ieee.org/semiconductors/processors/multicore-cpus-processor-proliferation">Multicore CPUs: Processor Proliferation</a>.
    <cite>IEEE Spectrum</cite>, January 2011.<!--good architecture intro, power wall, data parallelism-->

### 2010
* Blaauw, David and Shidhartha Das.
  <a href="http://www.spectrum.ieee.org/semiconductors/processors/cpu-heal-thyself">CPU,
  Heal Thyself</a>. <cite>IEEE Spectrum</cite>, August 2009. (Distributed 2010-03-08)
* Dally, Bill.
  <a href="http://www.forbes.com/2010/04/29/moores-law-computing-processing-opinions-contributors-bill-dally.html">Life
  	After Moore's Law</a>. <cite>Forbes.com</cite>, 29 April 2010. (Distributed 2010-05-04)
* Hyde, Justin.
  <a href="http://www.freep.com/apps/pbcs.dll/article?AID=/201003160300/BUSINESS0104/3160361&template=fullarticle">Cosmic rays studied in acceleration probe</a>.
  <cite>Detroit Free Press</cite>, Wednesday 17 March 2010. (Distributed 2010-03-17)
* Jones, Willie D.
  <a href="http://spectrum.ieee.org/semiconductors/design/onchip-routers-could-be-a-choke-point-for-future-chips">On-Chip Routers Could be a Choke Point for Future Chips</a>.
  <cite>IEEE Spectrum</cite>, March 2010. (Distributed 2010-03-18)
* Savage, Neil.
  <a href="http://spectrum.ieee.org/semiconductors/processors/new-schemes-for-powering-processors">Grid
  on a Chip: Integrating a high-voltage grid is one way researchers think they could better distribute power on chips</a>.
  <cite>IEEE Spectrum</cite>, December 2009.

### 2009
* Santo, Brian and Sally Adee. <a href="http://www.spectrum.ieee.org/jan09/7129">Multicore Made Simple: Intel's Larrabee is a chip every designer already knows how to program</a>.
    <cite>IEEE Spectrum</cite>, January 2009.
* NVIDIA. <a href="GPU_Ventures_Launch_PR_FINAL.pdf">NVIDIA looking for the next great GPU computing company</a>. 10 March 2009.
* Farber, Rob.  <a href="http://www.ddj.com/cpp/207200659">CUDA, Supercomputing for the Masses</a>.
    <cite>Dr. Dobb's Journal</cite>, April 2008.
* Goldberg, David. <a href="http://docs.sun.com/source/806-3568/ncg_goldberg.html">What Every Computer Scientist Should Know About Floating-Point Arithmetic</a>.
    <cite>ACM Computing Surveys</cite>, March 1991.

## Lab
Weekly lab details are available on the main course website.
Most prelab assignments and in-lab activities will be conducted individually, but you are free to consult with other students and the professor on your assignment.

### Lab Check-out Sheets
* [Week 2](lw2-s20-checklist.pdf)
* [Week 3](lw3-s20-checklist.pdf)
* [Week 4](lw4-s20-checklist.pdf)
* [Week 5](lw5-s20-checklist.pdf)

## Quizzes
Quizzes will be given during most lab periods. The lowest
quiz grade will be dropped. No make-up quizzes will be given.

* Spring, 2018 Solutions:
  <a href="q01ans-s18.pdf">Quiz 1</a>,
  <a href="q02ans-s18.pdf">Quiz 2</a>,
  <a href="q03ans-s18.pdf">Quiz 3</a>,
  <a href="q04ans-s18.pdf">Quiz 4</a>,
  <a href="q05ans-s18.pdf">Quiz 5</a>,
  <a href="q06ans-s18.pdf">Quiz 6</a>,
  <a href="q07ans-s18.pdf">Quiz 7</a>,
  <a href="q08ans-s18.pdf">Quiz 8</a>,
  <a href="q09ans-s18.pdf">Quiz 9</a>,
  <a href="q10ans-s18.pdf">Quiz 10</a>
* Spring, 2017 Solutions:
  <a href="q01ans-s17.pdf">Quiz 1</a>,
  <a href="q02ans-s17.pdf">Quiz 2</a>,
  <a href="q03ans-s17.pdf">Quiz 3</a>,
  <a href="q04ans-s17.pdf">Quiz 4</a>,
  <a href="q05ans-s17.pdf">Quiz 5</a>,
  <a href="q06ans-s17.pdf">Quiz 6</a>,
  <a href="q07ans-s17.pdf">Quiz 7</a>,
  <a href="q09ans-s17.pdf">Quiz 8 (Week 9)</a>,
  <a href="q10ans-s17.pdf">Quiz 9 (Week 10)</a>
* Spring, 2016 Solutions:
  <a href="q01ans-s16.pdf">Quiz 1</a>,
  <a href="q02ans-s16.pdf">Quiz 2</a>,
  <a href="q03ans-s16.pdf">Quiz 3</a>,
  <a href="q04ans-s16.pdf">Quiz 4</a>,
  <a href="q05ans-s16.pdf">Quiz 5</a>,
  <a href="q06ans-s16.pdf">Quiz 6</a>,
  <a href="q07ans-s16.pdf">Quiz 7</a>,
  <a href="q09ans-s16.pdf">Quiz 8 (Week 9)</a>,
  <a href="q10ans-s16.pdf">Quiz 9 (Week 10)</a>

## Final exam
The final exam (samples: [2017](final-s17.pdf), [2009](final-s09.pdf)) will be given per the schedule that is published by the Registrar's Office in approximately week 6.
It may cover any of the learning objectives from the course, which are posted on the main course website.
The exam will last 2 hours. No notes, books, calculators, etc. may be used on the final.

## Grading

| Component  | Weight | Weight if Final Canceled |
| :---       |   ---: |                     ---: |
| Labs       | 34%    | 60%                      |
| Quizzes    | 33%    | 40%                      |
| Final Exam | 33%    |  0%                      |

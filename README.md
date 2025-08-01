# 3-Bit Up/Down Counter using JK Flip-Flops (Verilog)

## 📌 Overview
This project implements a **3-bit synchronous Up/Down counter** using **JK flip-flops** in Verilog HDL. Instead of giving different clocks to each stage, all flip-flops share the same `clk` signal. The toggling is controlled by **enable logic** (`en`, `w3`, and `w6`) based on the current state and `count_up` / `count_down` signals.

## 👨‍💻 Author
**Nikshitha Shree C V**  
B.E. in VLSI Design and Technology

## 🔧 Modules

### 1. `jk_flip_flop.v`
Implements a positive edge-triggered JK Flip-Flop with asynchronous reset and enable.

#### Inputs:
- `clk` – Clock
- `rst` – Active-high asynchronous reset
- `en` – Enable signal
- `j`, `k` – JK inputs

#### Output:
- `q` – Flip-flop output

#### Truth Table:
| J | K | Q(next) |
|---|---|---------|
| 0 | 0 | Q (No change) |
| 0 | 1 | 0 (Reset) |
| 1 | 0 | 1 (Set) |
| 1 | 1 | ~Q (Toggle) |

---

### 2. `updown_counter3bit.v`
Uses three JK flip-flops to create a 3-bit counter:
- Inputs: `clk`, `rst`, `en`, `count_up`, `count_down`
- Outputs: `a`, `b`, `c` (3-bit counter)

#### Internal Signals:
```verilog
not n1(nota, a);
not n2(notb, b);
and a1(w1, a, count_up);
and a2(w2, nota, count_down);
or  o1(w3, w1, w2); // enable for b

and a3(w4, b, count_up);
and a4(w5, notb, count_down);
or  o2(w6, w4, w5); // enable for c

Flip-Flop Instantiations:
jk_flip_flop ff1(.clk(clk), .en(en),  .rst(rst), .j(1'b1), .k(1'b1), .q(a));
jk_flip_flop ff2(.clk(clk), .en(w3),  .rst(rst), .j(1'b1), .k(1'b1), .q(b));
jk_flip_flop ff3(.clk(clk), .en(w6),  .rst(rst), .j(1'b1), .k(1'b1), .q(c));


Key Takeaways
JK Flip-Flop can be used as a toggle when J=K=1
Common clk, separate enable logic for selective toggling


Simulation Output Snapshot

Time   clk rst en count_up count_down  a b c
-----  --- --- -- -------- ----------- -------
 5000   1   1   1    0         0        0 0 0
10000   0   0   1    0         0        0 0 0
15000   1   0   1    0         1        1 0 0
...

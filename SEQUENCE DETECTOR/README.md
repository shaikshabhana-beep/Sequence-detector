# Sequence Detector – 1011

## Description

This project implements a **1011 sequence detector** using Verilog HDL.
The detector monitors a serial input and generates a HIGH output whenever the sequence `1011` is detected.

## Features

* Detects the sequence `1011`
* Overlapping sequence detection
* Synchronous design
* Active-high reset
* Written in Verilog HDL

## Files

* `sequence_detector.v` – Main Verilog design
* `sequence_detector_tb.v` – Testbench for simulation

## Input and Output

| Signal     | Direction | Description                  |
| ---------- | --------- | ---------------------------- |
| `clk`      | Input     | Clock signal                 |
| `reset`    | Input     | Active-high reset            |
| `din`      | Input     | Serial data input            |
| `detected` | Output    | HIGH when `1011` is detected |

## Working

The FSM moves through different states depending on the input bits.

```text
IDLE → S1 → S10 → S101 → DETECT
```

When the input sequence `1011` is received, `detected` becomes `1` for one clock cycle.

## Example

Input:

```text
1 0 1 1
```

Output:

```text
0 0 0 1
```

## Simulation

The testbench provides different input patterns and checks whether the sequence `1011` is detected correctly.

## Tools

* Verilog HDL
* Icarus Verilog / ModelSim / Vivado
* GTKWave (optional)


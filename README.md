# Conway's Game of Life in Zig using Raylib

This project is an implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in the Zig programming language, utilizing the [Raylib](https://www.raylib.com/) library for rendering. Conway's Game of Life is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It consists of a grid of cells that evolve over discrete time steps according to a simple set of rules.

## Features

- **Interactive Grid:** Add or remove cells with mouse input.
- **Real-Time Simulation:** Visualize the evolution of the grid in real-time.
- **Efficient Rendering:** Utilizes Raylib for optimized graphics rendering.

## Installation

### Prerequisites

- [Zig](https://ziglang.org/) (version 0.10.0 or later recommended)

### Cloning the Repository

```bash
git clone https://github.com/yusufakdenizxd/game-of-life.git
cd game-of-life
```

### Building the Project

Compile the project using Zig:

```bash
zig fetch --save git+https://github.com/Not-Nik/raylib-zig#devel
zig build run
```

## Rules of Conway's Game of Life

1. Any live cell with fewer than two live neighbors dies (underpopulation).
2. Any live cell with two or three live neighbors survives.
3. Any live cell with more than three live neighbors dies (overpopulation).
4. Any dead cell with exactly three live neighbors becomes a live cell (reproduction).

## Project Structure

- `src/`: Contains the Zig source files.
- `zig-cache/`: Zig build cache (generated after building).
- `zig-out/`: Zig build output (generated after building).

## Acknowledgments

- [Zig Language](https://ziglang.org/) for its simplicity and performance.
- [Raylib](https://www.raylib.com/) for providing an easy-to-use graphics library.
- [John Horton Conway](https://en.wikipedia.org/wiki/John_Horton_Conway) for inventing the Game of Life.

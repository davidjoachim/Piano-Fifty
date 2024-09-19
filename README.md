# **Piano Fifty**

Piano Fifty is a rhythm game built using the LÖVE 2D game framework. Players hit corresponding piano keys in time with on-screen prompts, aiming to score as high as possible within a 30-second time limit.

## **Game Overview**

In Piano Fifty, players aim to press correct keys to match on-screen tiles within a 30-second timer. The game tracks accuracy and provides feedback for each correct or incorrect press.

## **Key Features**

- **Countdown Timer**: A 3-second countdown before the game begins.
- **Piano Sound Effects**: Keys correspond to piano notes.
- **Dynamic Tile Generation**: Tiles appear as players hit correct keys.
- **Score Tracking**: Player’s score increases with each correct key.
- **Endgame Screen**: Displays final score and replay option.

## **Gameplay Instructions**

1. Press "Enter" to start the 3-second countdown.
2. Match tiles with keys `A`, `S`, `D`, `F`, `J`, `K`, `L`, and `;`.
3. Press correct keys to score points.
4. The game ends after 30 seconds or upon an incorrect key press.
5. The final score will be displayed.

## **Controls**

- **Keys**: `A`, `S`, `D`, `F`, `J`, `K`, `L`, `;` (corresponding to on-screen tiles).
- **Enter/Return**: Start the game or replay.

## **Game States**

- **TitleScreenState**: Displays the game title and instructions.
- **CountdownState**: Manages the 3-second countdown.
- **PlayState**: Main gameplay state.
- **ScoreState**: Shows final score and replay option.

## **Project Structure**

- `BaseState.lua`: Base class for all game states.
- `CountdownState.lua`: Manages the countdown timer.
- `PlayState.lua`: Handles gameplay logic.
- `ScoreState.lua`: Displays score and options.
- `TitleScreenState.lua`: Handles the title screen.

## **Installation**

1. Install LÖVE from [love2d.org](https://love2d.org/).
2. Clone the repository or download the project files.
3. Run the game by:
    - Dragging the project folder onto the LÖVE executable (Windows/Mac).
    - Using `love .` in the terminal (Linux).

## **Technologies**

- **LÖVE 2D**: Game framework.
- **Lua**: Programming language.
- **Timer.lua**: Timing and delay management.

## **Acknowledgments**

Inspired by **Colton Ogden's** CS50 Game Development course. Special thanks to CS50 staff for their support.

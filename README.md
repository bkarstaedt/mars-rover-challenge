# Mars Rover Challenge [![Build Status](https://travis-ci.org/bkarstaedt/mars-rover-challenge.svg?branch=master)](https://travis-ci.org/bkarstaedt/mars-rover-challenge)

Rovers have been sent to Mars to survey the terrain and you have been charged with creating their navigation system. These are the specifications you have been given:

- Mars’s surface has been divided into zones and each zone can be modelled as a two-dimensional cartesian grid. The zones have been very carefully surveyed ahead of time and are deemed safe for exploration within the zone’s bounds, as represented by a single cartesian coordinate. E.g: (5, 5)
- The rover understands the cardinal points and can face either East (E), West (W), North (N) or South (S)
- The rover understands three commands:
    - M - Move one space forward in the direction it is facing
    - R - rotate 90 degrees to the right
    - L - rotate 90 degrees to the left
- Due to the transmission delay in communicating with the rover on Mars, you are only able to send the rover a list of commands. These commands will be executed by the rover and its resulting location sent back to HQ.

This is an example of the list of commands sent to the rover:

    8 8
    1 2 E
    MMLMRMMRRMML

This is how the rover will interpret the commands:

The first line describes how big the current zone is. This zone’s boundary is at the Cartesian coordinate of `8,8` and the zone comprises 64 blocks. The second line describes the rover’s staring location and orientation. This rover would start at position 1 on the horizontal axis, position 2 on the vertical axis and would be facing East (E). The third line is the list of commands (movements and rotations) to be executed by the rover.

As a result of following these commands, a rover staring at `1 2 E` in this zone would land up at `3 3 S`.

You are to design a program which takes a text file in the format as described above and then displays its resulting rover location to the console. Be sure to include:

- A README with clear instructions on how to use your program. Also include a brief description of the design decisions made in your program as well as how you have ensured your code’s correctness.
- The input to your program (as described above) as well as any additional inputs.

# Design Decisions

- for high cohesion slice the requirements into functional packages
  - import the HQ commands via an `Importer` class
  - model the cartesian grid via a `Zone` class
  - model the rover via a `Rover` class
- for loose coupling between classes make use of observer pattern
  - publish information about the rover's status to all subscribers
- miscellaneous
  - keep methods small
  - use expressive naming for methods and variables
  - fail early
  - make it run, make it right, make it fast
  - avoid "magic numbers" - give them a name
  - try to keep it understandable
  - separate visualization from business logic

# Usage

First run the mandatory `bundle install` in the root directory.

To run the rover app:

    ./main.rb

This will use the `example.data` file as input by default. If you want to provide your own file add it as the first argument:

    ./main.rb rover.data

[[https://github.com/bkarstaedt/mars-rover-challenge/blob/master/screenshot.png|alt=Mars Rover Challenge Screenshot]]

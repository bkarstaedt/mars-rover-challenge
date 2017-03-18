# Mars rover challenge

Rovers have been sent to Mars to survey the terrain and you have been charged with creating their navigation system. These are the specifications you have been given:

- Mars’s surface has been divided into zones and each zone can be modelled as a two-dimensional cartesian grid. The zones have been very carefully surveyed ahead of time and are deemed safe for exploration within the zone’s bounds, as represented by a single cartesian coordinate. E.g: (5, 5)
- The rover understands the cardinal points and can face either East (E), West (W), North (N) or South (S)
- The rover understands three commands:
    - M - Move one space forward in the direction it is facing
    - R - rotate 90 degrees to the right
    - L - rotate 90 degrees to the left
- Due to the transmission delay in communicating with the rover on Mars, you are only able to send the rover a list of commands. These commands will be executed by the rover and its resulting location sent back to HQ. This is an example of the list of commands sent to the rover:

    8 8
    1 2 E
    MMLMRMMRRMML

This is how the rover will interpret the commands:

The first line describes how big the current zone is. This zone’s boundary is at the Cartesian coordinate of `8,8` and the zone comprises 64 blocks. The second line describes the rover’s staring location and orientation. This rover would start at position 1 on the horizontal axis, position 2 on the vertical axis and would be facing East (E). The third line is the list of commands (movements and rotations) to be executed by the rover.

As a result of following these commands, a rover staring at `1 2 E` in this zone would land up at `3 3 S`.

You are to design a program which takes a text file in the format as described above and then displays its resulting rover location to the console. Be sure to include:

- A README with clear instructions on how to use your program. Also include a brief description of the design decisions made in your program as well as how you have ensured your code’s correctness.
- The input to your program (as described above) as well as any additional inputs.

# first Ideas

- Import the HQ commands via an `Importer` class
- Model the cartesian grid via a `Zone` class
- Model the rover via a `Rover` class
- Nice to have: visualization of the zone and rover moving around

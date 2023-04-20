# ClassWork 03 For NeXT CS
### Class Period:
### Name0: YOUR NAME HERE
### Name1: TABLE_BUDDY NAME HERE
### Name2: TABLE_BUDY+ NAME HERE (if applicable, delete this line if not)
---

## Gravity Fun!
In this repository you will find the Processing program __GravityCW__. It contains a driver file and an `Orb` class that uses the physics engine features we have been working on in class. The code is meant to simulate different scenarios involving gravity. The provided code is meant to help you on each of the tasks below. You do no need to modify the constants at the top of `GravityCW.pde`, if left alone, they should be sufficient to complete this work. The program responds to a number of different keystrokes, more will be explained later, but here are a few:
  - ` `: toggle orb movement on/off.
  - `b`: toggle bouncing off the walls on/off.
  - `t`: toggle trails on/off. If trails is on, then `background()` will not be called in `draw`, so you will be able to see the path each orb takes.
  - Arrow keys: Apply a force of `0.5` in the direction corresponding to the arrow key to all orbs.

## Task 0:
On line 32 of `Orb.pde` there is the following line of code: `d = constrain(d, 5, 100);`. What does this code do? What problem does it solve for us? How does it fix this problem?

YOUR ANSWER HERE

## Task 1: Mutual Attraction
In `GravityCW.pde` there is an array of `Orb` objects called `Orb`. This task is meant to be used in conjunction with the `randomSetup()` method, which you can run by pressing `r`. You can toggle mutual attraction mode on/off by pressing `m` When Mutual Attraction is on, then every orb should exert a gravitational force on every other orb. In order to do this, you need to do 2 things:
  1. Modify `draw()` in `GravityCW.pde` so that each orb in `orbs` exerts gravity on all other orbs.
  2. Modify `getGravity()` in `Orb.pde` so that an orb does not exert gravity on itself.


## Task 2: Earth Gravity
This task is meant to be used in conjunction with the `horizontalSetup()` method, which you can run by pressing `h`. You can toggle earth gravity mode on/off by pressing `e`. When Earth Gravity is on, each orb in the array should each orb should feel a downward gravity force similar to how the earth's gravity pulls on all objects on earth.

### Question 0:
In the real world, why are all objects on (or near) the earth pulled down?

YOUR ANSWER HERE

### Question 1:
How could you simulate this in your program?

YOUR ANSWER HERE

### Programming task
Modify `GravityCW.pde` to simulate earth's gravity. You should only add code to `setup()` and `draw()`. You will find a variable `earth` that you can use for this.


## Task 3: Orbit
This task is meant to be used in conjunction with the `verticalSetup()` method, which you can run by pressing `v`. You can toggle orbit mode on/off by pressing `o`. When Earth Gravity is on, a single orb at the center should exert a gravitational force on all the other orbs. You should attempt to get at least one of the orbs to trace a circular orbit around the center.

### Question 0:
In the real world, how do gravitational orbits occur?

YOUR ANSWER HERE

### Question 1:
How could you simulate this in your program?

YOUR ANSWER HERE

### Programming task
Modify `GravityCW.pde` to simulate this. You should only add code to `setup()` and `draw()`. You will find a variable `centerGravity` that you can use for this.

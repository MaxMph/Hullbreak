Title: Hullbreak

Author: @max h

Source code: https://github.com/MaxMph/Hullbreak

Day 1:

Today I got the project set up, made a temporary art asset to use for prototyping, then started working on the base of the game.
I got tilebased movement working in a way im pretty happy with. The player lerps toward a target pos, and when you move the target pos jumps to the next tile, but the player smoothly moves acordinly.
I also added collisions. Because of the way I am doing movement and the fact that the levels will be tilebased I opted for making my own fake collisions rather than using the built in engine ones. I made it so that you can have a tile that you instantiate, and it will have a bool that dictates weather it has collisions. when the player moves, it checks if there target pos is on a tile, and if it is, it checks if it has a collision. I did this in a global script in a way that I hope I can use for other collisions in the game, like enemys and projectiles and what not.

time: 2h
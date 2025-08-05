Title: Hullbreak

Author: @max h

Source code: https://github.com/MaxMph/Hullbreak

Day 1:

Today I got the project set up, made a temporary art asset to use for prototyping, then started working on the base of the game.
I got tilebased movement working in a way im pretty happy with. The player lerps toward a target pos, and when you move the target pos jumps to the next tile, but the player smoothly moves acordinly.
I also added collisions. Because of the way I am doing movement and the fact that the levels will be tilebased I opted for making my own fake collisions rather than using the built in engine ones. I made it so that you can have a tile that you instantiate, and it will have a bool that dictates weather it has collisions. when the player moves, it checks if there target pos is on a tile, and if it is, it checks if it has a collision. I did this in a global script in a way that I hope I can use for other collisions in the game, like enemys and projectiles and what not.

time: 2h

------------------------------------------------------------------------

Day 2:

Today I started work on the map generation. unfortunatly it didnt go all that well. I was hopping that I could get away with taking some shortcuts but I think I will have to redo what I have done in the next few days, substituting it for somthing a little cleaner and more usable. I spent a while trying to add doors but It was super anoying and still not fully working.
I also did some ui stuff but I ended up deleating it since I wanted to focus on it later.

time: 2.2h

------------------------------------------------------------------------

Day 3:

I restarted the map gen, and continued to struggle, this is taking longer than i hoped. I tried a few different things, but I keep realizing majorn issues with my strategies which cause me to either largely change or rewrite whe whole script. I think im moving toward somthing usable, but even once its done and working its not going to be very good, and its going to be a pain to work with. if I have time later I might redo it again, or at least make some big changes, but for now I need to just aim for a mvp.

time: 2.1h

Day 4:

today I started work on the combat. I got shooting working, at first I was thinking about doing a projectile, but I decided I wanted hitscan instead. I figured I could use a raycast since thats how I have done hitscan in the past, but since I am doing my own collisions that wouldnt work. instead I made something that has a similar result to raycast by cycling through tiles in a givin direction. I make a line 2d that turns gets its points removed in 0.1 seconds for the visual of shooting. this ended up having a tone of bugs, some relating to varios uses of global_position, position, and writen vectors that caused some weird effects, its all working now though and I feel a little more confident in my understanding of the line2d node in godot.

tume: 1.15h
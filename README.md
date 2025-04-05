# Particle System Image Art
### Steps
- Executable at `app\Particle_System_Art_Project.exe`
- Select an image
- Wait for a bit
- Drag mouse to spawn particles

## Snapshots

## How it Works
The program estimates the "gradient" of the brightness at each pixel ([Sobel Operator - Wikipedia](https://en.wikipedia.org/wiki/Sobel_operator)) using the surrounding pixels.

The vector will point toward the direction where the change in brightness is the greatest.
Now imagine the user dropping a bunch of particles on the canvas and letting them take the color of the image at the point they were spawned.
You could let them go in a line or a circle or something, but if you let them follow the estimated gradient vector at that pixel you'll get a cool result.

A cooler result would be to have the particles follow a direction that is a 90 degree rotation of the estimated gradient vector.
This causes the particles to revolve around bright spots in the image, and it's very fun to play with.

[Original IG Post](https://www.instagram.com/p/C6nVyYeu1IF/?img_index=1)

## History
- Nov. 2023 - Created original in Processing.js on Khan Academy after watching my Calculus 3 lecture. :) [Link](https://www.khanacademy.org/computer-programming/combining-w-particle-systems/5653797028413440)
- Summer 2024 - Rewrote in p5.js for an Nature of Code Error Page 404 entry. [Link](https://editor.p5js.org/emeraldblackbird/sketches/ayaheolVX)
- January 2025 - (This project) Rewrote in Processing for an art installation entry, runs much faster in real time.







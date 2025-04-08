# Particle System Image Art
### Steps
- Extract all contents in zip file.
- Find executable at `app\Particle_System_Art_Project.exe`
- Select an image
- Wait for a bit
- Drag mouse to spawn particles

## Snapshots
Original Image  
<img src="https://github.com/user-attachments/assets/554ef31c-d5d3-4c58-a2ac-630b1e42fa41" width="200" height="200">  
Final Image  
<img src="https://github.com/user-attachments/assets/d2e2ec5a-5ac5-4ead-92d3-48c02fc09001" width="200" height="200">

## How it Works
This project explores a unique way to interact with an image through art and mathematics.

The Processing program estimates the "gradient" of the brightness at each pixel ([Sobel Operator - Wikipedia](https://en.wikipedia.org/wiki/Sobel_operator)) using the surrounding pixels.

The vector will point toward the direction where the change in brightness is the greatest.
Now imagine the user dropping a bunch of particles on the canvas and letting them take the color of the image at the point they were spawned.
You could let them go in a line or a circle or something, but if you let them follow the estimated gradient vector at that pixel you'll get a cool result.

A cooler result would be to have the particles follow a direction that is a 90 degree rotation of the estimated gradient vector.
This causes the particles to revolve around bright spots in the image, and it's very fun to play with.

[Original IG Post](https://www.instagram.com/p/C6nVyYeu1IF/?img_index=1)

## History
- Nov. 2023 - Created original in Processing.js on Khan Academy after watching my Calculus 3 lecture. :) [Link](https://www.khanacademy.org/computer-programming/combining-w-particle-systems/5653797028413440)
- Summer 2024 - Rewrote in p5.js for an Nature of Code Error Page 404 entry. [Link](https://editor.p5js.org/emeraldblackbird/sketches/ayaheolVX)
- January 2025 - (This project) Rewrote in Processing for an art installation entry and Fractal, runs much faster in real time.







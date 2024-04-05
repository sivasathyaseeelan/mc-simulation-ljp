## Monte Carlo simulation of the Lennard-Jones Potential in the NVT (constant number of particles, volume, and temperature) ensemble

### Initializing the Simulation Box
This loop initializes the coordinates of particles randomly within the simulation box and appends
them to the particles list.

#### Monte Carlo Loop:
- At each step, it prints the current step number and total energy to the standard output
- A particle is randomly chosen to move
- The selected particle is moved randomly in each direction within a certain range (-1, 1) in
  reduced units
- The change in energy due to the particle move is evaluated
- The Metropolis acceptance rule is applied to decide whether to accept or reject the move
  based on the change in energy and the Boltzmann factor
- If the move is accepted, the particle coordinates and total energy are updated
- The energy of the system at each step is written to the CSV file.

### Function : wrap(particle)
#### Purpose

This function applies periodic boundary conditions to keep a particle within the
simulation box.


#### Explanation

It checks if each coordinate of the particle exceeds the simulation box dimensions
(L). If so, it adjusts the coordinate by subtracting or adding the box length (L) to bring
the particle back inside the box. It returns the adjusted particle coordinates.


### Function : Distancesq(particle1, particle2)
#### Purpose

This function calculates the squared distance between two particles, applying the
minimum image convention to account for periodic boundary conditions.



#### Explanation

It calculates the differences in each coordinate between two particles (dx, dy, dz).
Then, it applies the minimum image convention by adjusting the differences if they exceed
half the box length (halfL). Finally, it returns the squared distance between the particles.Function : 

### Energy(particles)
#### Purpose 

This function calculates the total energy of the system based on the Lennard-Jones potential.


#### Explanation 

It iterates through all pairs of particles, calculates the squared distance between each pair
using distancesq(), and checks if the distance is within the cutoff distance (truncsq). If it is, it
calculates the potential energy contribution from the pair and adds it to the total energy.

### Function : ParticleEnergy(particle, particles, p)
#### Purpose 

This function calculates the energy of a single particle due to its interactions with other particles.


#### Explanation

It iterates through all particles except the selected one (p), calculates the squared distance
between the selected particle and each other particle using distancesq(), and if the distance is within
the cutoff distance, it calculates the potential energy contribution from the interaction and adds it to
the particle's energy.

### Function : WriteEnergy(step, en)
#### Purpose

This function writes the step number and total energy of the system to a CSV file.


#### Explanation

It opens the 'energy.csv' file in append mode and writes the step number and total
energy (en) in the format step,energy followed by a newline character
Function : draw_curve(csv_file)
1. Initialization:
Two empty lists x and y are initialized to store the x and y coordinates of the curve.
2.Reading Data from CSV File:
« It opens the CSV file specified by csv_file in read mode
« Using csv.reader(), it reads each row of data from the file
« next(reader) is called to skip the header row if it is present
« For each row in the CSV file, it extracts the first and second values (assuming they
represent x and y coordinates respectively), converts them to float, and appends them to
the x and y lists.

### 3.Plotting the Curve:
<img src="./assets/Screenshot from 2024-04-06 00-22-52.png"></img> 

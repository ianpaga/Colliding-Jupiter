Smoothed Particle Hydrodynamics: Colliding Jupiter-like planets
====

Description: This code solves the Navier-Stokes equations under the approximation of Smoothed Particle Hydrodynamics (SPH) using a RK4 solver. 
For details on how the SPH approximation works, we refer the reader to the pioneering article 
of [J. Monaghan (1992)](https://ui.adsabs.harvard.edu/abs/1992ARA%26A..30..543M/abstract). 

This code shows the solution to the collision of two Jupiter-like planets, and we present the time evolution of the fluid quantities like pressure, density, internal energy and velocity
as a function of position. By running the file Colliding_Jupiter.m the solutions are saved in an array. By running video.m a movie is produced based on the solution of the previous program.

Each Jupiter-like planet consists of 600 SPH particles for which we track their position, velocity, pressure, density and internal energy. Using more particles is straightforward 
but compulationally demanding.

## Figures:

![collision](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/47b0d3b8-6da4-4ab6-8f93-79a3a4b7c876)
![collision(t=800)](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/d13eda20-56e3-491c-b6ac-11abcea35894)
![collision(t=1100)](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/b5a99a6d-c0b0-478f-8fab-488166a0bf6a)
![collision(t=3000)](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/142d9228-2702-4b50-8dc6-fe0c59a138aa)
![density_profile](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/ae20df97-dd2f-4734-b236-144930f8597b)
![initialcond](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/205e9ca1-4cd3-42e5-bd2e-b1ec98b91745)
![mass_histogram](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/6d6c0393-d101-47c2-8ac1-96f251dc97f1)
![phase_space](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/f243d245-1558-48f8-aa55-2fe0eeafbb2c)
![positions2D](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/5ffb99ce-ae0b-4e1d-bbdf-9e16a6eca62c)
![positions3D](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/e6834e50-1276-4fa4-977e-2da31fe96400)
![pressure_profile](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/62fe8b09-42d5-44be-9855-d0932a2a912e)
![pressure](https://github.com/ianpaga/Colliding-Jupiter/assets/57350668/26529ac4-3525-480e-bacb-59535b339ffe)

## Requirements:

- MATLAB (version 2017 or later)

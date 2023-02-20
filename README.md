# Stochastic-Processes-Calculator

My Project of the Probability and Stochastic Processes Course Offered in Fall 2020 @ Zewail City.

In this project, I created a MATLAB GUI-based tool that allows a user to enter any stochastic process and results its
ensemble and time statistics of such process. 

Moreover, the implmented GUI was used to plot the ACF and the PSD of the following binary stochastic processes:
1) Polar NRZ process
2) Unipolar NRZ process
3) Manchester process



=========================================
This is a Stochastic Process Calculator. 
=========================================

These are some guidelines for the attached files.

app1.mlapp
===========
-This is the GUI. The user needs to store his Random process ensemble and its time vector in 2 txt files. 

-The user will be requested to enter the valid names of the files which contain the Ensemble and time vector. 

-The GUI will search for the files with the entered names. Once they are found, a drop down-menu will appear to 
the user with all the offered options in the calculator. 

-The user needs to choose a certain option and the input cells of that option will appear automatically to the user 
in order for him to enter the parameters he/she wants.

-After entering the INPUTS, the user has to press DONE, then the OUTPUT figures/data will appear. 
If the OUTPUT is a Figure, a file with the data in the figure is stored in a txt file.
The User has the ability to enter another new data while running the GUI without exit and re-run the program. 

-He/she just needs to choose “---ENTER NEW DATA---” which is located at the end of the drop-down menu of the options, 
press DONE, after that he/she will be requested to enter the files’ names of the new data. 


=======================================================================================================================

Part1.m
=======
This file generates the random process that needs to be tested in part I. 
The ensemble is generated and saved in “Amplitude.txt” file, while the time vector is saved in “Time.txt” file. 

============================================================================================

Part2_Tb_1.m
============
This file generates the ensemble of PNRZ, UNRZ, Manchester Line codes at Tb = 1 sec and stores the matrices in txt files to be used in the GUI. 
The number of bits is 100. The time step is 0.1 sec. The file also generates the ACF and PSD of the processes in order to draw them in the 
required format as stated in Part II deliverables (Subplots). The values obtained in the document are the same as the ones obtained from the GUI. 

==========================================================================================

Part2_Tb_10.m
============
This file generates the ensemble of PNRZ, UNRZ, Manchester Line codes at Tb = 10 sec and stores the matrices in txt files to be used in the GUI. 
The number of bits is 100. The time step is 1 sec. The file also generates the ACF and PSD of the processes in order to draw them in the 
required format as stated in Part II deliverables (Subplots). The values obtained in the document are the same as the ones obtained from the GUI. 

=================================================================================================================================================

Part2_Tb_100.m
============
This file generates the ensemble of PNRZ, UNRZ, Manchester Line codes at Tb = 100 sec and stores the matrices in txt files to be used in the GUI. 
The number of bits is 100. The time step is 10 sec. The file also generates the ACF and PSD of the processes in order to draw them in the 
required format as stated in Part II deliverables (Subplots). The values obtained in the document are the same as the ones obtained from the GUI. 

=================================================================================================================================================



## Demo <a name="demo"></a>

https://user-images.githubusercontent.com/57066226/175558538-00bfa5c3-3dae-4160-868b-5ebbd8ed68ed.mp4

# Imperial HPC Tutorial

## Introduction

Imperial College's HPC system is great for you to use the brand new hardware and machines, but it's not user-friendly and 
confusing in many aspects:

* The PBS queuing system is easy to understand but hard to use and debug
* The HPC wiki is not that detailed and don't have enough hand-on scripts or programs
* The module system is not a modern way to handle package dependencies and has subtle bugs if you don't take care
* ...

In this tutorial, I'll help you clarify those confusing points, guide you to understand the principles, and finally use 
the HPC system to build a modern application (like Deep Learning).

## Table of Contents

This tutorial has the following major components:

1. [General introduction](#general-introduction) 
2. [Tutorial 1: Submit a simple Job](#tutorial-1-submit-a-simple-job)
3. [Tutorial 2: Submit a complex Job]()
4. [Tutorial 3: Compile your own program/library]()
5. [Tutorial 4: How to use Python]()
6. [Tutorial 5: Deep learing with Caffe]()

## General Introduction

### The seperation of environments

The major difference between the HPC system and your lab's server is: The HPC system seperates the **working** environment 
(also known as the **login system**) and the **computing** environment (also known as **nodes**). On the working environment,
you may compile your program, write scripts and **enqueue** your program into the queuing system. Then the computing 
environment will fetch and execute the program and data.

### The incompatible problem

In my point of view, this seperation is designed for computation efficiency, but not for development efficiency, mainly due
to the **incompatibility** between the working environment and the computation environment. The incompatibility lies in 
three different aspects:

1. **Libraries**: The working environment and the computing environment are two different OS, they may have different
Linux distribution, different kernel version number, and different libraries. Without explicit declaration and environment
variable assignment, you might find the program compiled on your working environment will fail on the remote computing 
environment due to incompatible library version.
2. **File system**: The working and computing environment do not share the file system (or they share in a weird way), so 
you must take care of all the programs with file IO.
3. **Computation Resources**: Here the resource means different processors, like CPU, GPU and Phi. There's no way to run 
GPU or Phi program on the working environment, so you could only test your GPU/Phi program by submitting the job to the 
computing environment, which consumes a lot of time and is EXTREMELY hard to debug.

Below is a coarse compararison between three different kinds of development system (for a computer science student):

| System Name           | Computation Efficiency | Development Efficiency |
|-----------------------|------------------------|------------------------|
| Imperial's HPC system | High                   | Low                    |
| Lab's server          | Moderate               | Moderate               |
| PC                    | Low                    | High                   |

### The queuing system

### The module system

### The way to survive

## Tutorial 1: Submit a simple job

In the context of this tutorial, a simple job means the program it contains will not have explicit external dependencies and will
not have file IO. However, it must take some time to execute, occupies an apparent amount of resources (like CPU and memory), or 
you will not have any discovery from `qstat` and have no understand in the PBS resource configuration, so I will choose Fibonacci
rather than the "Hello World" program. 



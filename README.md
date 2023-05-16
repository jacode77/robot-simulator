# Robot Challenge

## Installation & Setup

Environment: Built on MacOS Monterey 12.6.3

Ruby Version: 3.1.2p20

- The correct version can be installed via the following link [ruby-lang.org/en/documentation/installation/](ruby-lang.org/en/documentation/installation/)

Clone this repo:

`$ git clone` [https://github.com/jacode77/robot-simulator](https://github.com/jacode77/robot-simulator)

In the root file run bundle install:

`gem install bundler && bundle install`

## Run Robot Simulator

Run the program from the app root file:

`ruby robot.rb`

To quit at any time, enter `QUIT` in the terminal to close the application

---

## Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
- Input and output for this app have been made interactive, meaning the user will need to provide instructions to the robot via the terminal to make the robot move.

Create an application that can read in commands of the following form:

```plain
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
MOVE
REPORT
```

#### PLACE

- Will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

#### MOVE

- Will move the toy robot one unit forward in the direction it is currently facing.

#### LEFT and RIGHT

- Will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

#### REPORT

- Will announce the X,Y and orientation of the robot.
- A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and REPORT commands.
- The application must not exit after the first REPORT command, i.e. many REPORT commands can be received per session.
- It is up to you how you exit the application (e.g. exit command, Ctrl-C etc.)
- Provide test data to exercise the application.

## Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```plain
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```plain
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```plain
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

## Deliverables

The source files, the test data and any test code (as well as explanations of how to run everything).

## Common issues to avoid/think about

- edge case inputs break the application
- a large amount of input data will kill the application/cause it to be slow/cause it to be unresponsive
- it requires a lot of effort to add new commands to the application
- it requires a lot of effort to change the dimensions of the table
- the application is not resilient to changes in the format of the input
- the application is not resilient to changes in the source of the input
- the application is not resilient to changes in the format of the output
- elements of the design clearly violate SOLID (if OO)
- the solution doesn't invert any dependencies
- the solution violates DRY

## Self-assessment checklist

- Does the submission exhibit a good understand of OO and/or functional principles
- Does the submission exhibit a solid testing approach (good mix of unit and integration tests etc.)
- Does the submission exhibit well thought out variable/function/class naming
- Does the submission exhibit a solid approach to error handling (can't easily get a stack trace on the command line)
- Does the submission exhibit low coupling/high cohesion
- Is the code easy to read/understand/extend
- Would I be happy to have code of a similar standard in production
- Would I be happy to inherit/modify/extend/maintain code of a similar standard

# 64-Bit-Toy-Operating-System
Here is a toy OS made for me. It's kinda cool

# Running Container
Make sure docker is running first
```bash
# You only have to do this once
docker build -t name:tag .

# This takes you into a shell
docker run -it -v $(pwd):/os-workspace -p 1234:1234 name:tag
```
where name:tag is whatever you want. Run that first

# Rough Plan
## Phase 1 (Does the thing start? Hard Difficulty)
This operating system will run on 64-bit systems and utilize the Zig Programming Language
### Environment
- [ ] Setup Docker Container
- [ ] Install Programs like NASM, ZIG, and everything else
- [ ] Ensure the environment works on all contributors' systems

### First Run
Write some amd64 assembly to do the following
- [ ] Boot Loader
- [ ] Enter BIOS
- [ ] Make a Kernel
- [ ] Get to GRUB
- [ ] Start with some kind of thing on screen
- [ ] Be able to shut down

### Kernel
- [ ] Make a super basic kernel

## Phase 2 (Command Line Interface thingy, maybe, Super Hard)
We're not gonna let aunts and uncles manually allocate memory, nonono
### Shell
- [ ] Write a super basic shell (thing that allows users to poke the kernel)
- [ ] Have some basic programs like ls, cd, uname, things like that

### File System
- [ ] Write a file system, super basic, not too fancy. Maybe a FAT driver will work
- [ ] Be able to work with the shell and display to show where a user is in the file system

### Drivers
- [ ] Keyboard driver

## Phase 3 (User Mode Programs. Extremely Hard)
### Notepad clone
- [ ] Be able to start editing files (read and write text)
### File Explorer
- [ ] Navigate files and folders using a file explorer
### Printer?
- [ ] Write a driver for a printer? (This is probably impossible)

## Phase 4 (GUI, Nearly Impossible)
I don't expect to get here, but if somehow I do, then I'll add plans here later

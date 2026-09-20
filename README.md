# ARM Bootloader

*Main picture of what I learned in this journey is that writing
`bare-metal assembly` with no `OS` makes me a `compiler` and an
`operating system` at the same time.*

This repository documents how I went from my first `ARM Assembly` instruction
to a `bare-metal bootloader` for an `ARM Cortex-M3`, running in `QEMU`,
emulating the `Texas Instruments Stellaris LM3S6965` microcontroller.
Everything is written by hand and kept in the order I learned it,
mistakes included, emphasizing *core understanding*.

## Table of Contents

In case you want to skip the storytelling part of why I did this and the
[`motivation`](#motivation) is not that important, here are the main areas of
interest:

- [`arm_lessons`](./arm_lessons) : The place where I built my `ARM Assembly`
foundation. This could be of interest:
[`WHY`](#why-learn-arm-assembly-if-c-is-enough);

- [`x86-64_recall`](./x86-64_recall) : Recalling `x86-64`, the first
architecture I studied, and comparing it to `ARM`;

- [`boot_sector_x86`](./boot_sector_x86) : A tiny `BIOS` sector used to
understand what a bootloader even is;

- [`AI`](#about-use-of-ai) : **NO vibe coding.**

- [`bootloader_arm_in_c`](./bootloader_arm_in_c) : A simple `Cortex-M3`
bootloader that initializes memory and jumps to an application, written
in `C`.

# Final Project

- [`bootloader_arm_assembly`](./bootloader_arm_assembly) : A better `Cortex-M3`
bootloader that initializes memory and jumpts to an application, written in
`ARM Assembly`.

### Motivation

After becoming more and more interested in topics such as:
`hardware`, `CPU architecture`, `embedded`, `firmware`, and so on
(you see this is going to low-level things), I came to the conclusion
that a nice project would be to learn about a new CPU architecture like
`ARM` and then build something related to it, like a simple `bootloader`
that can be used for `embedded ARM development`.

At the time of starting this repository, I did not know exactly that the
final project will be an `ARM bootloader` for `embedded development`.
All I had in mind was to:

- Study a new CPU architecture → `ARM`;

- Build a piece of firmware    → `bootloader` for `embedded development`.

If you analyze the repo history then at some point you will find a period
where I was following along this book:
[baremetal-arm](https://github.com/umanovskis/baremetal-arm), written
by [Daniels Umanovskis](https://github.com/umanovskis).

The book is **great**, but starting from the third chapter, what I was reading
was diverging from my vision of this project.

I wanted to write everything mainly from scratch, having freestanding programs
so to speak, but at some point the author used an already built `bootloader`.

**THIS WAS THE MOMENT WHEN I DECIDED THAT I SHOULD BUILD A BOOTLOADER MYSELF!**

### Why learn ARM Assembly if C is enough

Since the bootloader is not that complex, `C` is already a good choice to stop
at, but I want to know each instruction the CPU will execute, it gives me a
feeling that I have more power on the machine;

Another thing that I can do is to use 'objdump' on the final binary, and that
still requires `assembly` knowledge;

When using `C`, the compiler is an additional piece of very complicated
software that I need to rely on. Even with specific flags that do not optimize
the code, I want to know what the CPU is doing;

That's my vision of low-level engineering, building things from scratch if they
are very complicated or not using at all meaning that I have to think like
them: Compiler + OS;

At the end of the day, every newly acquired skill can be useful and
`ARM Assembly` does not diappoint in engineering.

### About use of AI

**All of the conversations I had with AI systems that I believe are significant
for this repository are saved and can be analyzed.**
Other conversations with AI systems which I considered not as useful to keep
track of, I did not save them here.

The objective is to *actually* understand what I did here.

**There was no interest in vibe coding or pasting code that does not make sense
to me inside this repository.**
I believe this can be deduced from the prompts as well.

I really feel like in this way, the skills acquired are more valuable and
long-lasting. Going **fully in-depth** when learning something makes a **big**
difference between people who actually *understand* something and people that
only know [this](https://en.wikipedia.org/wiki/Popular_science).

*Thank you for reading this!*

`- M0KApointstoint`


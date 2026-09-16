# ARM Bootloader

## Table of contents

In case you want to skip the storytelling part of [`WHY`](###motivation)
I did this:

- [`ARM_lessons`](./lessons) : The place where I built my `ARM Assembly`
foundation;

- [`x86-64_recall`](./x86-64_linux_nasm) : Recalling `x86-64`, the first
architecture I studied, and comparing it to `ARM`;

- [`bootloader_x86`](./bootloader_x86) : A tiny `BIOS` sector used to
understand what a bootloader even is;

- [`AI`](###about-use-of-ai) : **NO vibe coding.**

### Main project

- [`bootloader_arm`](./bootloader_arm) : A simple Cortex-M3 bootloader that
initializes memory and jumps to an application.

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

The book is **great**, but starting from the third chapter, my vision
of the project was diverging from the contents I was reading.

I wanted to write everything mainly from scratch, having freestanding programs
so to speak, but at some point the author used an already built `bootloader`.

**THIS WAS THE MOMENT WHEN I DECIDED THAT I SHOULD BUILD A BOOTLOADER MYSELF!**

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


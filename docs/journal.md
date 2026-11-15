# Journal

## Stage 1 – Empty boot

### What I did

The file has an infinite loop that always sends the CPU back to the first byte.
The rest of the file is filled with zeros, so the file is exactly 512 bytes.
The last 2 bytes are an agreed signature, so the BIOS knows there is code to run.

### What I learned

The BIOS reads the first 512 bytes of the disk.
It checks if the last 2 bytes match the agreed signature `55 AA`.
If they match, it runs the code.

Why do we need an infinite loop?
So the CPU does not continue to the next bytes in memory,
run garbage as if it were instructions, and crash the computer.

### What surprised me

When I changed the signature to `0xAA56`, the BIOS did not run my code.
It said the disk is not bootable and started searching for other devices.
The signature is critical.

### Problems

None.

## Stage 2 – Print a char

### What I did

Put the "print a char" command (`0x0E`) in `AH`, put the char `'H'` in `AL`,
and called the BIOS with `int 0x10`.

### What I learned

The BIOS loaded the code and handed the job to the CPU.
But it left a way to call it for services it can do, such as printing.

### What surprised me

None.

### Problems

None.

## Stage 3 – Print a string

### What I did

Set `DS` to 0, and put the address of the string in `SI`.
Then wrote a loop that loads a char into `AL` and checks if it is 0 (end of the string).
If it is 0, the loop ends.
If not, the char is printed with `int 0x10` (`0x0E` in `AH`), and `SI` moves to the next char.

### What I learned

A string is just bytes in memory, and a label is the address of the first byte.
`[si]` means "the byte at the address in `SI`", not the address itself.
Data must be outside the code path, or the CPU will run it as instructions.

In 16-bit mode, one register is too small to point to all of memory.
So the CPU uses two: real address = `DS` × 16 + `SI`.
The BIOS does not promise the value of `DS`, so I set it to 0 myself.
A number can't be put into `DS` directly, so I used `AX`: `xor ax, ax` then `mov ds, ax`.

### What surprised me

Without the `0` at the end, the code still works, but only by luck:
NASM turns `times` into zeros, so the loop finds a `0` right after the string.

### Problems

At first, I put the string before the code, so the CPU would run the letters as commands.
I also read the char outside the loop, so it would print `H` forever.
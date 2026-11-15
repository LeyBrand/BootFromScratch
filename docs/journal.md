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
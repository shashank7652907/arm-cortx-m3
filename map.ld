MEMORY
{
    MEM : ORIGIN = 0x00, LENGTH = 0x4000
    RAM : ORIGIN = 0x20000000, LENGTH = 0x800

}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > MEM

    .data : {
           *(.data*)
    } > RAM

}


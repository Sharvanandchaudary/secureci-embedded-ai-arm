/* Simple STM32F103-compatible memory layout for QEMU testing */

ENTRY(_start)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 40K
}

SECTIONS
{
  .text : {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
    *(.glue_7)
    *(.glue_7t)
    *(.eh_frame)
  } > FLASH

  .data : AT (ADDR(.text) + SIZEOF(.text)) {
    *(.data*)
  } > RAM

  .bss : {
    *(.bss*)
    *(COMMON)
  } > RAM

  /* Optional stack section */
  .stack (COPY) : {
    stack_start = .;
    . = . + 0x1000; /* 4KB stack */
    stack_end = .;
  } > RAM

  _end = .;
  PROVIDE(end = .);
}

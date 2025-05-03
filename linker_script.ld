MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
  .text : {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
    
    . = ALIGN(4);
    KEEP(*(.ARM.exidx*))
    *(.eh_frame*)     /* Include but consume */
    
    . = ALIGN(4);
    _etext = .;
  } > FLASH

  .data : AT(_etext) {
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM

  .bss : {
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } > RAM

  .heap : {
    _end = .;
    PROVIDE(end = .);
    . = . + 0x1000;   /* Reserve 4KB for heap */
  } > RAM
}

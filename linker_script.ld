ENTRY(main)

MEMORY
{
  FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 256K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 40K
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
  .text : {
    *(.text*)
    *(.rodata*)
  } > FLASH

  .data : {
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM AT > FLASH

  _sidata = LOADADDR(.data);

  .bss : {
    __bss_start__ = .;
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
    __bss_end__ = .;
  } > RAM

  __end__ = .;
  PROVIDE(end = .);
}

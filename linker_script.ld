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
    __data_start__ = .;
    _sdata = .;
    *(.data*)
    _edata = .;
    __data_end__ = .;
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

  __heap_start__ = .;
  _end = .;
  __end__ = .;
  PROVIDE(end = .);
}

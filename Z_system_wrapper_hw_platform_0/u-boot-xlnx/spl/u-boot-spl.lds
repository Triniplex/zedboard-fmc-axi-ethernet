OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
 . = 0x0;
 . = ALIGN(4);
 .text :
 {
  __image_copy_start = .;
  *(.vectors)
  arch/arm/cpu/armv7/start.o (.text*)
  *(.text*)
 }
 . = ALIGN(4);
 .rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }
 . = ALIGN(4);
 .data : {
  *(.data*)
 }
 . = ALIGN(4);
 . = .;
 __image_copy_end = .;
 .rel.dyn : {
  __rel_dyn_start = .;
  *(.rel*)
  __rel_dyn_end = .;
 }
 _end = .;
 .bss __rel_dyn_start (OVERLAY) : {
  __bss_start = .;
  *(.bss*)
   . = ALIGN(4);
  __bss_end = .;
 }
 /DISCARD/ : { *(.dynsym) }
 /DISCARD/ : { *(.dynstr*) }
 /DISCARD/ : { *(.dynamic*) }
 /DISCARD/ : { *(.plt*) }
 /DISCARD/ : { *(.interp*) }
 /DISCARD/ : { *(.gnu*) }
 . = 0x100000;
 .ddr (NOLOAD) : {
  __ddr_start = .;
  *(.ddr*)
   . = ALIGN(4);
  __ddr_end = .;
 }
}
ASSERT(__image_copy_end - __image_copy_start < (0x30000), "SPL image too big");
ASSERT(__bss_end - __bss_start < (0x100000), "SPL image BSS too big");
ASSERT(__bss_end - _start < (0x30000), "SPL image plus BSS too big");

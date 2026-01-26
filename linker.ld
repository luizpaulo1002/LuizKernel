ENTRY(_start)

SECTIONS
{
    /* Kernel será carregado em 1MB de memória */
    . = 1M;

    /* Seção Multiboot (DEVE ser a primeira) */
    .multiboot BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
    }

    /* Seção de código */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.text)
    }

    /* Seção de dados somente leitura */
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    /* Seção de dados inicializados */
    .data BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
    }

    /* Seção de dados não inicializados */
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
}

# Unidad-Funcional-y-Registros
Un diseño de un datapath que une una unidad funcional (ALU + shifter) con una unidad de registros de 8 bits.
El objetivo de este proyecto es implementar en lenguaje VHDL un procesador basado en un conjunto sencillo de instrucciones. El
procesador estará diseñado para manejar datos de 8 bits y ser capaz de realizar 20 operaciones diferentes. 

Estas operaciones incluyen
funciones aritméticas, lógicas y de desplazamiento. La implementación del procesador se realizará mediante la interconexión de
diversas unidades funcionales, como la unidad aritmética, la unidad lógica, el shifter y la unidad de registros.

## Características

- Unidad Aritmética: Permite hacer operaciones de suma, resta (complemento a dos), incremento, decremento, y transferencia en vectores de 8 bits.   
- Unidad Lógica: Permite hacer las operaciones de NOT, AND, OR, NAND, NOR, XOR, XNOR en vectores de 8 bits. 
- Shifter: Permite hacer las operaciones de desplazamiento izquiera y derecha, rotación izquiera y derecha sobre 8 bits.
- Unidad de Registros: 8 registros de 8 bits cada uno, permite almacenar y recuperar datos.

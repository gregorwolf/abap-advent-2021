*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
TYPES: BEGIN OF ty_intruction,
         direction TYPE string,
         units     TYPE int4,
       END OF ty_intruction.

TYPES: BEGIN OF ty_intruction_with_key,
         step TYPE int4.
         INCLUDE TYPE ty_intruction.
TYPES: END OF ty_intruction_with_key.

TYPES: ty_intructions TYPE TABLE OF ty_intruction_with_key WITH KEY step.

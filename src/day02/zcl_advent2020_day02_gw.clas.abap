CLASS zcl_advent2020_day02_gw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_gw.
    METHODS:
      part1
        IMPORTING
          !input        TYPE string
        RETURNING
          VALUE(output) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      input_to_intructions
        IMPORTING
          !input             TYPE string
        RETURNING
          VALUE(intructions) TYPE ty_intructions.
ENDCLASS.



CLASS zcl_advent2020_day02_gw IMPLEMENTATION.

  METHOD input_to_intructions.
    DATA: intruction TYPE ty_intruction,
          units      TYPE string.
    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings ASSIGNING FIELD-SYMBOL(<string>).

      SPLIT <string> AT ' ' INTO intruction-direction units.
      intruction-units = units.

      APPEND INITIAL LINE TO intructions ASSIGNING FIELD-SYMBOL(<intruction>).
      <intruction>-step = sy-tabix.
      MOVE-CORRESPONDING intruction TO <intruction>.
    ENDLOOP.

  ENDMETHOD.

  METHOD part1.
    DATA: x TYPE int4,
          y TYPE int4.
    DATA(intructions) = input_to_intructions( input ).

    LOOP AT intructions ASSIGNING FIELD-SYMBOL(<intruction>).
      CASE <intruction>-direction.
        WHEN 'forward'.
          x = x + <intruction>-units.
        WHEN 'down'.
          y = y + <intruction>-units.
        WHEN 'up'.
          y = y - <intruction>-units.
      ENDCASE.
    ENDLOOP.
    DATA(out_int) = x * y.
    output = out_int.
    CONDENSE output.

  ENDMETHOD.


  METHOD zif_advent2020_gw~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
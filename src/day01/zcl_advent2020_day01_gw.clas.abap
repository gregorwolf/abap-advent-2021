CLASS zcl_advent2020_day01_gw DEFINITION
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
          VALUE(output) TYPE string,
      part2
        IMPORTING
          !input        TYPE string
        RETURNING
          VALUE(output) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      input_to_ints
        IMPORTING
          !input      TYPE string
        RETURNING
          VALUE(ints) TYPE ty_ints.
ENDCLASS.



CLASS zcl_advent2020_day01_gw IMPLEMENTATION.


  METHOD zif_advent2020_gw~solve.

    output = part2( input ).

  ENDMETHOD.

  METHOD input_to_ints.
    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings ASSIGNING FIELD-SYMBOL(<string>).
      APPEND INITIAL LINE TO ints ASSIGNING FIELD-SYMBOL(<int>).
      <int> = <string>.
    ENDLOOP.

  ENDMETHOD.

  METHOD part1.
    DATA out_int TYPE int4.

    DATA(ints) = input_to_ints( input ).

    LOOP AT ints ASSIGNING FIELD-SYMBOL(<int>).
      IF sy-tabix > 1.
        IF <int> > ints[ sy-tabix - 1 ].
          out_int = out_int + 1.
        ENDIF.
      ENDIF.
    ENDLOOP.

    output = out_int.
    CONDENSE output.

  ENDMETHOD.

  METHOD part2.
    DATA: out_int            TYPE int4.

    DATA(ints) = input_to_ints( input ).

    DATA(number_of_ints) = lines( ints ).
    IF number_of_ints < 4.
      WRITE / 'input does contain less than 4 lines so there is nothing to compare'.
      RETURN.
    ENDIF.

    LOOP AT ints ASSIGNING FIELD-SYMBOL(<int>).
      DATA(tabix) = sy-tabix.
      IF sy-tabix + 3 > number_of_ints.
        EXIT.
      ENDIF.
      DATA(sum_first_window) = <int> + ints[ tabix + 1 ] + ints[ tabix + 2 ].
      DATA(sum_second_window) = ints[ tabix + 1 ] + ints[ tabix + 2 ] + ints[ tabix + 3 ].
      IF sum_first_window < sum_second_window.
        out_int = out_int + 1.
      ENDIF.
    ENDLOOP.

    output = out_int.
    CONDENSE output.

  ENDMETHOD.

ENDCLASS.
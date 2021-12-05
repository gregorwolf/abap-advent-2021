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
        EXPORTING
          VALUE(ints) TYPE tt_ints.
ENDCLASS.



CLASS zcl_advent2020_day01_gw IMPLEMENTATION.


  METHOD zif_advent2020_gw~solve.

    output = me->part2( input ).

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

    me->input_to_ints(
      EXPORTING
        input = input
      IMPORTING
        ints  = DATA(ints)
    ).

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
    DATA: out_int            TYPE int4,
          number_of_ints     TYPE int4,
          sum_first_window   TYPE int4,
          sum_second_wondows TYPE int4.

    me->input_to_ints(
      EXPORTING
        input = input
      IMPORTING
        ints  = DATA(ints)
    ).

    DESCRIBE TABLE ints LINES number_of_ints.
    IF number_of_ints < 4.
      WRITE / 'input does contain less than 4 lines so there is nothing to compare'.
      RETURN.
    ENDIF.

    LOOP AT ints ASSIGNING FIELD-SYMBOL(<int>).
      IF sy-tabix + 3 <= number_of_ints.
        sum_first_window = ints[ sy-tabix ] + ints[ sy-tabix + 1 ] + ints[ sy-tabix + 2 ].
        sum_second_wondows = ints[ sy-tabix + 1 ] + ints[ sy-tabix + 2 ] + ints[ sy-tabix + 3 ].
        IF sum_first_window < sum_second_wondows.
          out_int = out_int + 1.
        ENDIF.
      ENDIF.
    ENDLOOP.

    output = out_int.
    CONDENSE output.

  ENDMETHOD.

ENDCLASS.

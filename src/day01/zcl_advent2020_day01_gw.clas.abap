CLASS zcl_advent2020_day01_gw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_gw .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_advent2020_day01_gw IMPLEMENTATION.


  METHOD zif_advent2020_gw~solve.

    DATA: lt_ints TYPE TABLE OF int4,
          out_int TYPE int4.

    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings ASSIGNING FIELD-SYMBOL(<string>).
      APPEND INITIAL LINE TO lt_ints ASSIGNING FIELD-SYMBOL(<int>).
      <int> = <string>.
    ENDLOOP.

    LOOP AT lt_ints ASSIGNING <int>.
      IF sy-tabix > 1.
        IF <int> > lt_ints[ sy-tabix - 1 ].
          out_int = out_int + 1.
        ENDIF.
      ENDIF.
    ENDLOOP.

    output = out_int.
    CONDENSE output.

  ENDMETHOD.
ENDCLASS.
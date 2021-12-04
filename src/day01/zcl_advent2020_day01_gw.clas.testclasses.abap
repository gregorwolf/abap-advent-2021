CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day01_gw.
    METHODS setup.
    METHODS solve FOR TESTING.
ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD solve.

    DATA(lv_result) = mo_cut->zif_advent2020_gw~solve( |199\n200\n208\n210\n200\n207\n240\n269\n260\n263| ).

    cl_abap_unit_assert=>assert_equals(
        act = lv_result
        exp = |7| ).

  ENDMETHOD.

ENDCLASS.

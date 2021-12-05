CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day02_gw.
    METHODS setup.
    METHODS solve FOR TESTING.
ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD solve.

    DATA(lv_result) = mo_cut->part1( |forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2| ).

    cl_abap_unit_assert=>assert_equals(
        act = lv_result
        exp = |150| ).

  ENDMETHOD.

ENDCLASS.

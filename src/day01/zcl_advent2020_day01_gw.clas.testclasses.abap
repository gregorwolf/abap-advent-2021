CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day01_gw.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( |199\n200\n208\n210\n200\n207\n240\n269\n260\n263| ).

    cl_abap_unit_assert=>assert_equals(
        act = lv_result
        exp = |7| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( |199\n200\n208\n210\n200\n207\n240\n269\n260\n263| ).
    cl_abap_unit_assert=>assert_equals(
        act = lv_result
        exp = |5| ).

  ENDMETHOD.

ENDCLASS.

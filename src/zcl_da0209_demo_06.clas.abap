CLASS zcl_da0209_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_da0209_demo_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  out->write( |Username: { sy-uname }| ).
  out->write( |System Language: { sy-langu }| ).
  out->write( |Mandant: { sy-mandt }| ).
  out->write( |System Date: { sy-datum DATE = USER }| ).
  out->write( |System Time: { sy-uzeit TIME = USER }| ).
  out->write( |Client Date: { sy-datlo DATE = USER }| ).
  out->write( |Client Time: { sy-timlo TIME = USER }| ).

  data numbers type table of i . " Java List<Integer> numbers = new ArrayList<>();
  APPEND 5 to numbers. "Java: numbers.add(5);
  APPEND 7 to numbers. "Java: numbers.add(7);
  APPEND 3 to numbers. "Java: numbers.add(3);
  APPEND 5 to numbers. "Java: numbers.add(5);
  APPEND 1 to numbers. "Java: numbers.add(1);

  ENDMETHOD.
ENDCLASS.

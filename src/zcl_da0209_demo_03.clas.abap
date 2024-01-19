CLASS zcl_da0209_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da0209_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA result type zda0209_decimal.

  " Arithmetic Operators

  result = 5 + 3.
  out->write(  result ).

  result = 5 - 3.
  out->write(  result ).

  result = 5 * 3.
  out->write(  result ).

  result = 5 / 3.
  out->write(  result ).

  result = 5 ** 3.
  out->write(  result ).

  result = 5 DIV 3.
  out->write(  result ).

  result = 5 MOD 3.
  out->write(  result ).

  " Increment / Decrement
  result = result + 1.
  result += 1.
  " result++. geht nicht
  " ADD 1 TO result. wird nicht empfohlen

  " Arithmetic Functions
  result = abs( -5 ).
  out->write( result ).

  result = round( val = '687.57' dec = -1 ).
  out->write( result ).

  ENDMETHOD.
ENDCLASS.

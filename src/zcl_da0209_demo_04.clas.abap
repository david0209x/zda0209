CLASS zcl_da0209_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da0209_demo_04 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  data text1 type string value 'Hello'.
  data text2 type string value 'World'.

  data(text3) = |{ text1 } { text2 }|.
  data(text4) = text1 && | | && text2.

  out->write( text3 ).
  out->write( text4 ).

  out->write( |Length: { strlen( text3 ) }| ).

  ENDMETHOD.
ENDCLASS.

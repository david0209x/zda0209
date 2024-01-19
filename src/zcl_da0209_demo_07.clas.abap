CLASS zcl_da0209_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_da0209_demo_07 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE zda0209_connection.
    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-departure_airport_id = 'FRA'.
    connection-arrival_airport_id = 'JFK'.

    out->write( connection-connection_id ).

  ENDMETHOD.
ENDCLASS.

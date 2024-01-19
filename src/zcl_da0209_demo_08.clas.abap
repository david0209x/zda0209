CLASS zcl_da0209_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_da0209_demo_08 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connections TYPE TABLE OF zda0209_connection.
    DATA connection TYPE zda0209_connection.

    " insert data
    connection-departure_airport_id = 'FRA'.
    connection-arrival_airport_id = 'JFK'.
    connection-carrier_id = 'UA'.
    APPEND connection TO connections.

    APPEND VALUE #( carrier_id = 'LH' connection_id = '0400' ) TO connections.

    connection-carrier_id = 'AA'.
    connection-connection_id = '0017'.
    connections = VALUE #( BASE connections
    ( connection_id = '401' carrier_id = 'LH' )
    (  )
    ( connection ) ).

    " read data
    try.
    out->write( connections[ 3 ] ). " with index; index interne tabelle startet bei 1
    catch cx_sy_itab_line_not_found.
    Endtry.

    " out->write( connections[ 30 ] ). " exception

    if line_exists( connections[ carrier_id = 'LH' ] ).
      out->write( connections[ carrier_id = 'LH' ] ).
    endif.
    " Java: if (vehicle instanceof Car){
    " Java:    Car car = (Car) vehicle;
    " Java: }
    " Downcast => Problem redundanz weil zuerst überprüft wird und dann ausgeführt wird

    Loop at connections into connection where carrier_id = 'LH'.
      out->write( connection-connection_id ).
    endloop.
    "Java: for (Connection connection : connections){
    "Java:     if (connection.getCarrierId().equals("LH")){
    "Java:         sysout(connection);
    "Java:     }
    "Java: }

    out->write( connections[ carrier_id = 'UA' ] ). "with components
    " out->write( connections[ carrier_id = 'LH' ] ). " wert mehrfach vorhanden => nur erster treffer wird geliefert
    " out->write( connections[ carrier_id = 'LQ' ] ). " exception

    " modify data
    connections[ 4 ]-arrival_airport_id = 'TXL'.
    connections[ 4 ]-departure_airport_id = 'SVO'.
    connections[ arrival_airport_id = 'TXL' ]-carrier_id = 'JL'.

    "with table expression -medium
    loop at connections into connection where carrier_id = 'LH'.
      " connection-carrier_id = 'LHX'. "wert der hilfskopie wird geändert aber das original nicht
      connections[ sy-tabix ]-carrier_id = 'LHX'.
    endloop.

    "with data reference -gut
    "data connection2 type ref to zda0209_connection.
    loop at connections reference into data(connection2) where carrier_id = 'LHX'.
      connection2->carrier_id = 'LHD'.
    endloop.

    " with field symbol - sehr gut
    " field-symbols <connection3> type zda0209_connection.
    loop at connections assigning field-symbol(<connection3>) where carrier_id = 'LHD'.
      <connection3>-carrier_id = 'SLH'.
    endloop.

    "delete data
    delete connections index 4. "with index
    delete connections where departure_airport_id is initial.

    "sort data
    sort connections by carrier_id descending connection_id ascending departure_airport_id descending.
  ENDMETHOD.
ENDCLASS.

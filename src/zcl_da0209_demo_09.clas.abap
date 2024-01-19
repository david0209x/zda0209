CLASS zcl_da0209_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da0209_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "select * from <source> where <condition>
  "ABAP CDS: select from <source> { <fields> } where <condition>
  "ABAP: select from <source> fields <fields> where <condition> into <data object>. "data object kann structure oder interne table sein

  data connection type zi_da0209_connection. "CDS view -best practice
  data connection2 type zda0209_connection. "structure view
  data connection3 type /dmo/connection. "database table
  data connections type table of zi_da0209_connection.

  "read single entry -structure
  select single from zi_da0209_connection
    fields *
    where CarrierId = 'LH' and ConnectionId = '0401'
    into @connection.
  if sy-subrc <> 0. "subroutine return code
  endif.
  if sy-dbcnt = 0.
  endif.

  "read multiple entries -interne tabelle
  select from zi_da0209_connection
  fields *
  where CarrierId = 'LH'
  into table @connections.

  "read multiple entries with loop
  select from zi_da0209_connection
  fields *
  where CarrierId = 'LH'
  into @connection.
  "Authorization check
*  AUTHORITY-CHECK OBJECT '/dmo/S_CARRID'
*  ID 'CARRID' FIELD connection-CarrierId
*  ID 'ACTVT' FIELD '03'.
*  if sy-subrc = 0.
*  append connection to connections.
*  endif.
  endselect.

  " target data object definition
  select single from zi_da0209_connection
  fields CarrierId, connectionId, AirportFromId, AirportToId
  into @connection2.

  select single from zi_da0209_connection
  fields CarrierId, DepartureTime, Distance
  into corresponding fields of @connection. " nur in namensgleiche felder kopieren

  select single from zi_da0209_connection
  fields CarrierId, DepartureTime, Distance
  into @data(connection4).
  ENDMETHOD.
ENDCLASS.

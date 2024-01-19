CLASS zcl_da0209_main_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_da0209_main_vehicle IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA vehicle TYPE REF TO zcl_da0209_vehicle. " Java: Vehicle vehicle;

    DATA(vehicle2) = NEW zcl_da0209_vehicle( make = 'Audi' model = 'A4' ).

    DATA vehicles TYPE TABLE OF REF TO zcl_da0209_vehicle.
    " Java: List<Vehicle> vehicles = new ArrayList<>();

    vehicle = NEW #( make = 'Porsche' model = '911' ).

    APPEND vehicle TO vehicles.
    APPEND vehicle2 TO vehicles.

    try.
      vehicle->brake( 50 ).
    catch cx_abap_invalid_value into data(x).
      out->write( x->get_text(  ) ).
    endtry.

    vehicle2->accelerate( 90 ).

    clear: vehicle, vehicle2.

    out->write( zcl_da0209_vehicle=>number_of_vehicles ).
    LOOP AT vehicles INTO DATA(v).
      out->write( v->to_string( ) ).
    ENDLOOP.

    " out->write( value #( for v in vehicles( v ) ) )

  ENDMETHOD.
ENDCLASS.

CLASS zcl_da0209_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string.

    METHODS accelerate
      IMPORTING
        value TYPE i.

    METHODS brake
      IMPORTING
        value TYPE i
          raising cx_abap_invalid_value.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_da0209_vehicle IMPLEMENTATION.

  METHOD constructor.
    me->make = make.
    me->model = model.
    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD accelerate.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    if speed_in_kmh - value < 0.
      " Java throw new InvalidValueException();
      RAISE EXCEPTION new cx_abap_invalid_value( value = 'VALUE' ).
    endif.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h)|.
    " oder modern: return |{ make } { model } ({ speed_in_kmh }km/h)|.
  ENDMETHOD.

ENDCLASS.

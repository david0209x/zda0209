CLASS zcl_da0209_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da0209_demo_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA flight_date TYPE /dmo/flight_date VALUE '20240115'.

    " Cases
    IF carrier_id <> 'LH' OR NOT ( flight_date >= '20240101' AND flight_date <= '20241231' ).
      out->write( 'true' ).
    ELSE.
      out->write( 'false' ).
    ENDIF.

    out->write( COND #( WHEN carrier_id = 'LH' THEN 'true' ELSE 'false' ) ).

    IF carrier_id = ''.
      out->write( 'carrier id is initial' ).
    ENDIF.

    IF carrier_id IS INITIAL.
      out->write( 'carrier id is initial' ).
    ENDIF.

    IF flight_date BETWEEN '20240101' AND '20241231'.
      out->write( 'flight date is in 2024' ).
    ENDIF.

    IF flight_date > '20240101'.

    ELSEIF flight_date > '20230101'.

    ENDIF.

    CASE carrier_id.
      WHEN 'LH' OR 'lh'.
        out->write( 'Lufthansa' ).
      WHEN 'AA' OR 'aa'.
        out->write( 'American Airlines' ).
      WHEN OTHERS.
        out->write( 'other' ).
    ENDCASE.

    out->write(  SWITCH #( carrier_id
                            WHEN 'LH' OR 'lh' THEN 'Lufthansa'
                            WHEN 'AA' THEN 'American Airlines'
                            ELSE 'other' ) ).

    "Java: System.out.println( switch carrierId {
    "     case "LH", "lh" -> "Lufthansa";
    "     case "AA", "aa" -> "American Airlines";
    "     default -> "other";
    "     });
    "
    "Loops
    "Java: int i = 0;
    "       while( i < 10) {
    "         i++;
    "         sysout(i);
    "       }

    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    DO.
      IF sy-index = 11.
        EXIT.
      ENDIF.
      out->write( sy-index ).
    ENDDO.

  ENDMETHOD.
ENDCLASS.

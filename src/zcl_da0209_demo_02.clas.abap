" Java: byte, short, int, long, float, double, char, boolean, Sring, LocalDateTime
CLASS zcl_da0209_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_da0209_demo_02 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " JAVA: String text = "Hello World"

    "ABAP Standard Types and Declaration of Data Objects
    DATA number TYPE i. " int number; Integer (42)
    DATA text TYPE string. " String text; String with dynamic length ( 'Hello World' )
    DATA first_name TYPE c LENGTH 6. " String first_name; String with static length ( 'Daniel' )
    DATA matriculation_number TYPE n LENGTH 7. " numerical sequence ('8102743')
    DATA today TYPE d. " Date ('20240115') Zeichenkette der Länge 8 yyyymmdd
    DATA now TYPE t. " Time ('104322') Zeichenkette der Länge 6 hhmmss
    DATA price_in_euro TYPE p LENGTH 8 DECIMALS 2. " Decimal Number ('299.95'), length in byte
    DATA carrier_id TYPE /dmo/carrier_id. " die verweden damit kompatibel mit anderen Programmen, Standardtypen nur für Hilfsvariablen
    DATA connection_id TYPE /dmo/connection_id. " mit f2 mehr infos

    " value allocation
    number = 42.
    text = 'Hello World'.
    first_name = 'Daniel'.
    matriculation_number = '8102743'.
    today = '20240115'.
    now = '104322'.
    price_in_euro = '299.95'.
    carrier_id = 'LH'.
    connection_id = 400.
    DATA flight_date TYPE /dmo/flight_date VALUE '20240115'.
    " var text = "Hello World";
    DATA(number2) = 463. " implizite Typermittlung + Zuweisung, Datentyp danach nicht mehr änderbar

    DATA flight_price TYPE zda0209_decimal.

    " Constants
    CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.

    " Initialization
    number = 0.
    text = ''.
    CLEAR first_name.


    out->write(  price_in_euro ). " möglich

  ENDMETHOD.
ENDCLASS.

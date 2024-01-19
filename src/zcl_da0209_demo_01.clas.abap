* public final class Demo1 {
*
*   public static void main(String[] args){
*       System.out.println("Hello World"); //Comment
*   }
*
* }


CLASS zcl_da0209_demo_01 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_da0209_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'Hello World' ). "Comment
  ENDMETHOD.
ENDCLASS.

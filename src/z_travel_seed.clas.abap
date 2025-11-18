CLASS z_travel_seed DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_TRAVEL_SEED IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.
        DELETE FROM ztravel_tb.
        COMMIT WORK.
        INSERT  ztravel_tb FROM (
        SELECT * FROM /dmo/travel_m ).

        commit work.
        out->write( 'Travel Details seeded the tables' ).
    ENDMETHOD.
ENDCLASS.

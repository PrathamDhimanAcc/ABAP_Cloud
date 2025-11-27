CLASS zabap_pract3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zabap_pract3 IMPLEMENTATION.
    method if_oo_adt_classrun~main.
        data update_tab type table for update Z_TRAVEL_M.
        update_tab = value #( ( AgencyId = '070041' CustomerId = '000594' Description = 'Pratham Vaccation' ) ).

        modify entities of z_travel_m
            entity z_travel_m
            update fields ( Description )
            with update_tab.

        commit work.
    endmethod.
ENDCLASS.

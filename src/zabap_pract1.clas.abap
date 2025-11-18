CLASS zabap_pract1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zabap_pract1 IMPLEMENTATION.
    method if_oo_adt_classrun~main.
           data travel type z_travel_m.

           select single
            from z_travel_m
            fields TravelId, AgencyId, CustomerId, BeginDate, EndDate, BookingFee, TotalPrice, CurrencyCode, Description, OverallStatus, CreatedBy , CreatedAt, LastChangedBy, LastChangedAt
            where TravelId = '00000001' and AgencyId = '070041'
            into @travel.

            types : begin of st_conn,
                        airport_from_id type /dmo/airport_from_id,
                        airport_to_id type /dmo/airport_to_id,
                        carrier_name type /dmo/carrier_name,
                    end of st_conn.
            types : begin of st_conn2,
                     airport_from_id type /dmo/airport_from_id,
                        airport_to_id type /dmo/airport_to_id,
                        carrier_name type /dmo/carrier_name,
                        msg type symsg,
                        end of st_conn2.
             data conni type st_conn.
             data conni_m type st_conn2.

                 conni_m = value #( airport_from_id = 'UUU'
                                  airport_to_id = 'UXY'
                                  carrier_name = 'Ethad'
                                  msg-msgty = 'E'
                                  msg-msgid = 'ABC'
                                  msg-msgno = '123' ).


                conni = corresponding #( conni_m except carrier_name ).

                out->write( data = conni name = 'Yo ' ).
                out->write( data = conni_m name = 'Yo' ).

    endmethod.
ENDCLASS.

CLASS zabap_pract2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zabap_pract2 IMPLEMENTATION.
    method if_oo_adt_classrun~main.
        types : begin of st_conn,
                carrier_id type /dmo/carrier_id,
                connection_id type /dmo/connection_id,
                airport_from_id type /dmo/airport_from_id,
                airport_to_id type /dmo/airport_to_id,
                carrier_name type /dmo/carrier_name,
                end of st_conn.

        types tt_connections type sorted table of st_conn with unique key carrier_id connection_id.

        data connections_5 type tt_connections.

        data connection like line of connections_5.

        connection = value #( carrier_id = 'UU'
                              connection_id = '1234'
                              airport_from_id = 'ABC'
                              airport_to_id = 'XYI'
                              carrier_name = 'First airline' ).



        connections_5 = value #( ( carrier_id = 'NN'
                                   connection_id = '1235'
                                   airport_from_id = 'ABC'
                                   airport_to_id = 'XYI'
                                   carrier_name = 'Second airline' ) ).

        append connection to connections_5.

        DATA(n1) = cl_abap_char_utilities=>newline.

        loop at connections_5 into connection.
             out->write( |Connection : { connection-carrier_id } { n1 }| &&
                         |Carrier ID : { connection-carrier_name } { n1 }| &&
                         |Connection ID : { connection-connection_id } { n1 }| &&
                         |Conn from aiport ID : { connection-airport_from_id } { n1 }| &&
                         |Conn to airport ID :  { connection-airport_to_id } { n1 }{ n1 } | ).
        endloop.

*         types connections_4 type sorted table of st_conn with unique key carrier_id connection_id.
        data connections_4 type tt_connections.
        connections_4 = corresponding #( connections_5 except airport_from_id airport_to_id ).

        out->write( |{ n1 }{ n1 }{ n1 }| ).

        loop at connections_4 into connection.
             out->write( |Connection : { connection-carrier_id } { n1 }| &&
                         |Carrier ID : { connection-carrier_name } { n1 }| &&
                         |Connection ID : { connection-connection_id } { n1 }| &&
                         |Conn from aiport ID : { connection-airport_from_id } { n1 }| &&
                         |Conn to airport ID :  { connection-airport_to_id } { n1 }{ n1 } | ).
        endloop.


    endmethod.
ENDCLASS.

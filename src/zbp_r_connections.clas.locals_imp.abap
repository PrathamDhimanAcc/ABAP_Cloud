CLASS lhc_Z_R_CONNECTIONS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_r_connections RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR z_r_connections RESULT result.
    METHODS getcities FOR DETERMINE ON MODIFY
      IMPORTING keys FOR z_r_connections~GetCities.

    METHODS checksemantickey FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_connections~checksemantickey.

    METHODS validateairports FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_connections~validateairports.

    METHODS validatecarrier FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_connections~validatecarrier.

    METHODS validateprice FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_connections~validateprice.


ENDCLASS.

CLASS lhc_Z_R_CONNECTIONS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD GetCities.
  ENDMETHOD.

  METHOD CheckSemanticKey.
    data failed_rec like line of failed-z_r_connections.
    data reported_rec like line of reported-z_r_connections.

    read entities of z_r_connections
    in local mode
    entity z_r_connections
    fields ( UUID CarrierID ConnectionID )
    with corresponding #( keys )
    result data(conns).

    loop at conns into data(c).
        select single uuid from zaconnections
        where carrier_id = @c-CarrierID
        and connection_id = @c-ConnectionID
        and uuid = @c-uuid
        into @data(conn_exists).

        if conn_exists is not initial.
            failed_rec-%tky = c-%tky.
            append failed_rec to failed-z_r_connections.

            reported_rec-%tky = c-%tky.
            reported_rec-%msg = new_message(
                id = 'z_connections'
                number = '001'
                v1 = c-CarrierID
                v2 = c-ConnectionID
                severity = ms-error ).
            reported_rec-%element-carrierid = if_abap_behv=>mk-on.
            reported_rec-%element-connectionid = if_abap_behv=>mk-on.
            append reported_rec to reported-z_r_connections.
        endif.

    endloop.

  ENDMETHOD.

  METHOD ValidateAirports.
  ENDMETHOD.

  METHOD ValidateCarrier.
  ENDMETHOD.

  METHOD ValidatePrice.
    data failed_rec like line of failed-z_r_connections.
    data reported_rec like line of reported-z_r_connections.

    read entities of z_r_connections
    in local mode
    entity z_r_connections
    fields ( Price )
    with corresponding #( keys )
    result data(conns).


    loop at conns into data(c).
        if c-Price <= 99.
            failed_rec-%tky = c-%tky.
            append failed_rec to failed-z_r_connections.

            reported_rec-%tky = c-%tky.
            reported_rec-%msg = new_message(
                id = 'ZCONNECTIONS_MSG'
                number = '099'
                severity = if_abap_behv_message=>severity-error
                v1 = |99|
             ).

             reported_rec-%element-price = if_abap_behv=>mk-on.
             append reported_rec to reported-z_r_connections.

        endif.
    endloop.


  ENDMETHOD.

ENDCLASS.

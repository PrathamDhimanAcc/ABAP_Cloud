@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connections CDS view entity Model'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_R_CONNECTIONS
 as select from zaconnections
{
    key uuid as UUID,
    carrier_id as CarrierID,
    connection_id as ConnectionID,
    
    airport_from_id as AirportFromID,
    airport_to_id as AirportToID,
    
    city_from as CityFrom,
    country_from as CountryFrom,
    city_to as CityTo,
    country_to as CountryTo,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as    Price,
    currency_code as CurrencyCode,
    
    
    is_approved as IsApproved,
    
    
    created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt
}

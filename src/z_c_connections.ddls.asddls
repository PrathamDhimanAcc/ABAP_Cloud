@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connections CDS view entity Projection'

@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections',
    title : {
        type: #STANDARD,
        value : 'CarrierID'
    }
}
@Metadata.ignorePropagatedAnnotations: false
define root view entity Z_C_CONNECTIONS provider contract transactional_interface as projection on Z_R_CONNECTIONS
{
       key UUID, 
       CarrierID, 
       ConnectionID, 
       AirportFromID, 
       CityFrom, 
       CountryFrom, 
       AirportToID, 
       CityTo, 
       CountryTo, 
       Price, 
       CurrencyCode
}

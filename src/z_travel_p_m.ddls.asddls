@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel CDS Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_TRAVEL_P_M provider contract transactional_query as projection on Z_TRAVEL_M
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Currency,
    _Customer,
    _Status
}

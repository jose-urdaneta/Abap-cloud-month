@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'Ztrap100_JU'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TRAP100_JU
  as select from ztrap100__ju as Travel
  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.largeObject: { mimeType: 'MimeType',   //case-sensitive mimeType: It indicates the name of the field containing the type of a MIME object. ⚠ The value is case sensitive.
                       fileName: 'FileName',   //fileName: It indicates the name of the field containing the file name of a MIME object. ⚠ The value is case sensitive.
                       acceptableMimeTypes: ['image/png', 'image/jpeg'], //  It provides the list of acceptable MIME types for the related stream property to restrict or verify the user entry accordingly. If any subtype is accepted, this can be indicated by *.
                       contentDispositionPreference: #ATTACHMENT } // It indicates whether the content is expected to be displayed inline in the browser, i.e., as a Web page or as part of a Web page, or as an attachment, i.e., downloaded and saved locally.
      attachment            as Attachment,
      @Semantics.mimeType: true 
      mime_type             as MimeType,
      file_name             as FileName,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      //public associations
      _Customer,
      _Agency,
      _OverallStatus,
      _Currency
}

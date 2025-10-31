namespace go app

struct GenerateQrisResponse {
    1: optional string responseCode
    2: optional string responseMessage
    3: optional string referenceNo
    4: optional string partnerReferenceNo
    5: optional string qrContent
    6: optional string terminalId
    7: optional map<string, string> additionalInfo
}

struct QueryQrisResponseAmount {
    1: string value
    2: string currency
}

struct QueryQrisResponseAdditionalInfo {
    1: optional string approvalCode
    2: optional string convenienceFee
    3: optional string issuerId
    4: optional string issuerName
    5: optional string terminalId
    6: optional string customerName
}

struct QueryQrisResponse {
    1: optional string responseCode
    2: optional string responseMessage
    3: optional string originalReferenceNo
    4: optional string originalPartnerReferenceNo
    5: optional string serviceCode
    6: optional string latestTransactionStatus
    7: optional string transactionStatusDesc
    8: optional string paidTime
    9: optional QueryQrisResponseAmount amount
    10: optional QueryQrisResponseAmount feeAmount
    11: optional QueryQrisResponseAdditionalInfo additionalInfo
}

struct RefundQrisResponse {
    1: optional string responseCode
    2: optional string responseMessage
    3: optional string originalReferenceNo
    4: optional string originalPartnerReferenceNo
    5: optional string refundNo
    6: optional string partnerRefundNo
    7: optional QueryQrisResponseAmount refundAmount
    8: optional string refundTime
}

struct MerchantInfo {
    1: string memrchantPAN
    2: string acquirerName
}

struct DecodeQrisResponseAdditionalInfo {
    1: string pointOfInitiationMethod
    2: string pointOfInitiationMethodDescription
    3: string feeType 
    4: string feeTypeDescription
}

struct DecodeQrisResponse {
    1: string responseCode
    2: optional string postalCode
    3: string responseMessage
    4: optional string referenceNo
    5: optional string partnerReferenceNo
    6: optional string merchantName
    7: optional QueryQrisResponseAmount transactionAmount
    8: list<MerchantInfo> merchantInfos
    9: optional DecodeQrisResponseAdditionalInfo feeAmount
}

struct PaymentQrisResponse {
    1: optional string responseCode
    2: optional string responseMessage
    3: optional string referenceNo
    4: optional string partnerReferenceNo
    5: optional QueryQrisResponseAmount amount
    6: optional QueryQrisResponseAmount feeAmount
}

service QrisService {
    // After customer creates an order and choose QRIS as the payment method,
    // merchant will hit this API to generate QRIS that will be shown to the customer.
    GenerateQrisResponse GenerateQris()(api.post="v1/qris/generate")

    QueryQrisResponse QueryQris()(api.post="v1/qris/query")

    RefundQrisResponse RefundQris()(api.post="v1/qris/refund")

    DecodeQrisResponse DecodeQris()(api.post="v1/qris/decode")

    PaymentQrisResponse PaymentQris()(api.post="v1/qris/payment")
}
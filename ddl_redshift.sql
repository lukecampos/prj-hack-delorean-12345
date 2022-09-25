ACCOUNTS:

create table accounts.accounts_accounts (
accountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
brandName varchar(256),
companyCnpj varchar(256),
type varchar(256),
compeCode varchar(100),
number vachar(256),
checkDigit number,
);

create table accounts.accounts_details (
accountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
compeCode varchar(100),
brachCode varchar (256),
number vachar(256),
checkDigit number,
type varchar(256),
subtype(256),
currency(256),
);

create table accounts.accounts_balances (
accountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
availableAmount numeric(12,2),
avilableAmountCurrency varchar(256),
blockedAmount int,
blockedAmountCurrency varchar(256),
automaticallyInvestedAmount int,
automaticallyInvestedAmountCurrency varchar(256),
);

create table accounts.accounts_transactions (
accountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
transactionId vachar(256),
completedAuthorisedPaymentType varchar(256),
creditDebitType varchar(256), 
transactionName varchar(256),
type char(100),
amount numeric(12,2),
transactionCurrency varchar(256),
transactionDate varchar(256),
CREartieCnpjCpf varchar(256),
partiePersonType varchar(256) ,
partieCompeCode varchar(256),
partieBranchCode varchar(256),
partieNumber varchar(256),
partieCheckDigit int,
);

create table accounts.accounts_overdraft_limits (
accountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
overdraftContractedLimit int,
overdraftContractedLimitCurrency varchar(256),
overdraftUsedLimit int,
overdraftUsedLimitCurrency varchar(256),
unarrangedOverdraftAmount int,
unarrangedOverdraftAmountCurrency varchar(256),
);



CREDIT-CARDS:

create table credit_cards.credit_cards (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
name char(100),
productType char(100),
creditCardNetwork char(100),
);

create table credit_cards.credit_cards_details (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
name char(100),
productType char(100),
creditCardNetwork char(100),
paymentMethod {
identificationNumber varchar(256),
isMultiplecreditCard boolean,
}
);

create table credit_cards.credit_cards_limits (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
creditLineLimitType varchar(256),
consolidationType varchar(256),
identificationNumber varchar(256),
isLimitFlexible boolean,
limitAmountCurrency varchar(256),
limitAmount numeric(16,2),
usedAmountCurrency varchar(256),
usedAmount numeric(16,2),
availableAmountCurrency varchar(256),
availableAmount numeric(16,2),
);

create table credit_cards.credit_cards_transactions (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
transactionId varchar(256),
identificationNumber number,
transactionName varchar(256),
creditDebitType varchar(256),
transactionType varchar(256),
paymentType varchar(256),
feeType varchar(256),
chargeIdentificator null,
chargeNumber null,
brazilianAmount numeric(8,2),
amount numeric(8,2), 
currency varchar(256),
transactionDate date
billPostDate date
payeeMCC null,
billId varchar(256),
);

create table credit_cards.credit_cards_bills (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
billId varchar(256),
dueDate date,
billTotalAmount numeric(16,2),
billTotalAmountCurrency varchar,
billMinimumAmount numeric(36,2), 
billMinimumAmountCurrency varchar,
isInstalment boolean,
financeCharges null,
payments null,
);

create table credit_cards.credit_cards_bills_transactions (
creditCardAccountId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
transactionId varchar(256),
identificationNumber number,
transactionName varchar(256),
creditDebitType varchar(256),
transactionType varchar(256),
paymentType varchar(256),
feeType varchar(256),
chargeIdentificator null,
chargeNumber null,
brazilianAmount numeric(8,2),
amount numeric(8,2), 
currency varchar(256),
transactionDate date
billPostDate date
payeeMCC null,
billId varchar(256),
);




CUSTOMERS:

create table customers.financial_relation (
customerId varchar(256),
organizationId varchar(256),
productsServicesType varchar(256),
productsServicesTypeAdditionalInfo varchar(256),
accounts {
compeCode varchar,
branchCode varchar,
number number,
checkDigit int,
type varchar,
subtype varchar,
}
);

create table customers.personal_identification (
personalId varchar(256),
organizationId varchar(256),
customerId varchar(256),
brandName varchar(256),
civilName varchar(256),
socialName varchar(256),
birtDate date,
sex varchar(256),
maritalStatusCode varchar(256),
companyCnpj varchar(256),
documents{
cpfNumber varchar(256),
passportNumber varchar(256),
passportCountry varchar(256),
passportExpirationDate date,
passportIssueDate date,
}
otherDocuments null,
HasBrazilianNationality boolean,
nationality{
otherNationalitiesInfo varchar(256),
}
filiation null,
contacts{
portalAdress{
isMain boolean,
address varchar(256),
districName varchar(256),
townName varchar(256),
ibgeTowcode varchar(256),
countrySubDivision varchar(256),
postcode varchar(256),
country varchar(256),
countryCode varchar,
}
}
phones{
isMain boolean,
type varchar,
additionalInfo varchar(256),
countryCallingCode Varchar(256),
areaCode varchar,
number number,
phoneExtension null,
}
emails{
isMain boolean
email varchar(256),
);

create table customers.personal_qualification (
customerId varchar(256),
organizationId varchar(256),
brandName varchar(256),
companyCnpj varchar(256),
occupationCode varchar(256),
occupationDescription int,
informedIcome {
frequebcy varchar,
amount numeric(14,2)
currency varchar(256),
date date,
}
informedPatrimony {
amount numeric(16,2),
currency varchar(256),
year number,
}
);


FINANCINGS:


create table financings.financings_contracts (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
brandName varchar(256),
companyCnpj varchar(256),
productType varchar(256),
ipocCode varchar(256),
);

create table financings.financings_details (
contractId varchar(256),
customerId varchar(256),
organizationName varchar(256),
ipocCode varchar(256),
productName varchar,
productType varchar,
contracteDate date,
settlementDate varchar(256),
contractAmount numeric(18,2),
currency varchar(256),
dueDate date,
instalmentPeriodicity varchar(256),
instalmentPeriodicityAdditionalInfo varchar(256),
firstInstalmentDueDate date,
CET numeric(34,2),
amortizationScheduled varchar(256),
amortizationScheduledAdditionalInfo varchar,
interestRates {
taxType varchar(256),
interestRateType varchar(256),
refrentialRateIndexerType varchar(256),
referentialRateIndexerSubType varchar(256),
referentialRateIndexerAdditionalInfo varchar(256),
preFixedRate numeric(36,2),
postFixedRate varchar,
additionalInfo varchar(256),
}
contractedFees {
feeName varchar(256),
feeCode varchar(256),
feeChargeType varchar(256),
feeCharge varchar(256),
feeAmount numeric(8,2),
}
contractedFinaceCharge{
chargeType varchar(256),
chargeAddditionalInfo varchar(256),
chargeRate numeric(36,2),
}
);

create table financings.financings_warranties (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
currency varchar(100),
warranType varchar(256),
warrantySubType varchar(256),
warrantyAmount numeric(20,2),
);

create table financings.financings_payments (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
paidInstalments number,
contractOutstandingBalance numeric(20,2),
releases {
isOverparcelPayment boolean,
paymentId varchar(256),
instalmentId varchar(256),
paidDate date,
currency varchar,
paidAmount numeric(36,2),
overParcel{
fees{
feename varchar,
feeCode varchar,
feeAmount int,
}
charges {
chargeType varchar(256),
chargeAdditionalInfo varchar,
chargeAmount int,
}
}
}
);

create table financings.financings_scheduled_instalments (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
typeNumberOfInstaments varchar(100),
totalNumberOfInstalments varchar(100),
typeContractRemaining varchar(100),
contractRemainingNumber number,
paidInstalments int,
dueInstalments int,
pastDueInstaments int,
ballonPayments null,
);

LOANS:

create table loans.loans_contracts (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
brandName varchar(256),
companyCnpj varchar(256),
productType varchar(256),
productSubType varchar(256),
ipocCode varchar(256),
);

create table loans.loans_details (
contractId varchar(256),
contractNumber varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
ipoCode varchar,
productName varchar(256),
productType varchar(100),
productSubType varchar(256),
contracdate date,
settlementDare varchar,
contractAmount numeric(16,2),
currency varchar(100),
dueDate date,
instalmentPeriodicity varchar(100),
firstInstalmentPeriodicityAdditionalInfo varchar(256),
CET numeric(36,2),
amortizationScheduled varchar(100),
amortizationScheduledAdditionalInfo varchar,
cnpjConsignee varchar(256),
interestRates{
taxType varchar(100),
interestRateType varchar(100),
taxPeriodicity varchar(20),
calculation varchar (100),
referentialRateIndexerType varchar(100),
preFixedRate numeric(38,2),
postFixedRate varchar,
additionalInfo varchar(100),
}
contractedFees{
feeName varchar(100),
feeCode varchar(100),
feeChargeType varchar(100),
feeCharge varchar(100),
feeAmount numeric(10,2),
feeRate numeric(36,2),
}
contractedFinanceCharges{
chargeType varchar(256),
chargeAdditionalInfo varchar(256),
chargeRate numeric(36,2),
);

create table loans.loans_warranties (
create table financings.financings_warranties (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
currency varchar(100),
warranType varchar(256),
warrantySubType varchar(256),
warrantyAmount numeric(20,2),
);

create table loans.loans_payments (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
paidInstalments number,
contractOutstandingBalance numeric(20,2),
releases {
isOverparcelPayment boolean,
instalmentId varchar(256),
instalmentId varchar(256),
paidDate date,
currency varchar,
paidAmount numeric(36,2),
overParcel{
fees{
feename varchar,
feeCode varchar,
feeAmount int,
}
charges {
chargeType varchar(100),
chargeAdditionalInfo varchar,
chargeAmount int,
}
}
}
);

create table loans.loans_scheduled_instalments (
contractId varchar(256),
customerId varchar(256),
organizationId varchar(256),
organizationName varchar(256),
typeNumberOfInstaments varchar(100),
totalNumberOfInstalments varchar(100),
typeContractRemaining varchar(100),
contractRemainingNumber number,
paidInstalments int,
dueInstalments int,
pastDueInstaments int,
ballonPayments null,
);











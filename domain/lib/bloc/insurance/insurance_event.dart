abstract class InsuranceEvent {
  const InsuranceEvent();
}

class InsuranceViewRequested implements InsuranceEvent {}

class InsuranceQuoteRequested implements InsuranceEvent {}

class InsuranceClaimRequested implements InsuranceEvent {}

class InsuranceBarkibuInformationRequested implements InsuranceEvent {}

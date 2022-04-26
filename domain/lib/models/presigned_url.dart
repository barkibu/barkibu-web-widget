class PresignedUrl {
  final String url;
  final UrlFields fields;

  const PresignedUrl({
    this.url,
    this.fields,
  });
}

class UrlFields {
  final String key;
  final String acl;
  final String successActionStatus;
  final String policy;
  final String credential;
  final String algorithm;
  final String date;
  final String signature;

  const UrlFields({
    this.key,
    this.acl,
    this.successActionStatus,
    this.policy,
    this.credential,
    this.algorithm,
    this.date,
    this.signature,
  });
}

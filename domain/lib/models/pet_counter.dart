enum PetCounterType {
  ASSESSMENT,
  VET_CONSULTATION,
  CLAIM,
}

class PetCounter {
  final int count;
  final PetCounterType type;

  PetCounter({
    this.count,
    this.type,
  });
}

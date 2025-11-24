BigInt calculateFactorial(int n) {
  BigInt result = BigInt.one;
  for (int i = 1; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

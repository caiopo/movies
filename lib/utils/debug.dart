extension ExpressionPrint<T> on T {
  T get eprint {
    print(this);
    return this;
  }
}

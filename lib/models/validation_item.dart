class ValidationItem<T> {
  final T? value;
  final String? error;

  ValidationItem(this.value, this.error);

  ValidationItem<T> copy({
    T? value,
    String? error,
  }) {
    return ValidationItem(value, error);
  }
}
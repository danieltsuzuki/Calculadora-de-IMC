class InputException implements Exception {
  final String message;
  InputException(this.message);

  @override
  String toString() {
    return 'InputException(message: $message)';
  }
}

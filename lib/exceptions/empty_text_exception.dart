class EmptyTextException implements Exception {
  final String message;

  const EmptyTextException([this.message = "O texto não pode ser vazio"]);
}

extension ValidationFailedExtensions on String {
  static const defaultPasswordLength = 3;

  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }

  bool get isValidUserName {
    return trim().isNotEmpty;
  }

  bool get isValidPassword {
    return trim().length >= defaultPasswordLength;
  }
}

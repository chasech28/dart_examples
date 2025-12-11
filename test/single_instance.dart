class Singleton {
  // Private static instance of the Singleton class
  static final Singleton _instance = Singleton._internal();

  factory Singleton() => _instance;

  // Private constructor to prevent instantiation
  Singleton._internal();
}
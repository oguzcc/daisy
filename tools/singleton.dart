// How to initiate: SingletonOne one = SingletonOne();
// Factory constructor
class SingletonOne {
  SingletonOne._();
  factory SingletonOne() => _instance;
  static final SingletonOne _instance = SingletonOne._();
}

// How to initiate: SingletonTwo two = SingletonTwo.instance;
// Static field with getter
class SingletonTwo {
  SingletonTwo._();
  static final SingletonTwo _instance = SingletonTwo._();
  static SingletonTwo get instance => _instance;
}

// How to initiate: SingletonThree three = SingletonThree.instance;
// Static field
class SingletonThree {
  SingletonThree._();
  static final SingletonThree instance = SingletonThree._();
}

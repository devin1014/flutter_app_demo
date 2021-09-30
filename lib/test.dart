void main() {
  // Future.delayed(Duration(seconds: 2), () {
  //   // return "Future.result2";
  //   throw AssertionError("Error2");
  // }).then((value) {
  //   print(value);
  // }, onError: (e) {
  //   print(e);
  // }).whenComplete(() {
  //   print("Future2 complete.");
  // });

  exeFuture(delay: 1, success: true)
      .then((value) => print(value))
      .catchError((err) => print(err));

  exeFuture(delay: 2, success: false)
      .then((value) => print(value))
      .catchError((err) => print(err));

  // Future.wait([
  //   Future.delayed(Duration(seconds: 2), () {
  //     return "Result1";
  //   }),
  //   Future.delayed(Duration(seconds: 3), () {
  //     return "Result2";
  //   })
  // ]).then((values) {
  //   print(values[0]);
  //   print(values[1]);
  // }).catchError((e) {
  //   print(e);
  // });

  Stream.fromFutures([
    Future.delayed(Duration(seconds: 1), () {
      return "1";
    }),
    Future.delayed(Duration(seconds: 2), () {
      return "2";
    }),
    Future.delayed(Duration(seconds: 3), () {
      return "3";
    })
  ]).listen((event) {
    print(event);
  }, onError: (e) {
    print(e);
  }, onDone: () {
    print("done");
  });

  Log().log();
}

Future exeFuture({delay: int, success: bool}) async {
  return Future.delayed(Duration(seconds: delay), () {
    if (success)
      return "exeFuture";
    else
      throw AssertionError("Error");
  });
}

class Extends {
  void log() {
    print('extends');
  }
}

mixin Mixins {
  void log() {
    print('mixin');
  }
}

mixin Mixins2 {
  void log() {
    print('mixin2');
  }
}

class Implements {
  void log() {
    print('implements');
  }
}

class Log extends Extends with Mixins, Mixins2 implements Implements {
  void log() {
    super.log();
  }
}

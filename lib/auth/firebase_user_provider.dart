import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Checkit2FirebaseUser {
  Checkit2FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Checkit2FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Checkit2FirebaseUser> checkit2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Checkit2FirebaseUser>(
      (user) {
        currentUser = Checkit2FirebaseUser(user);
        return currentUser!;
      },
    );

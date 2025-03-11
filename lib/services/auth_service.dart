import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// ✅ Get current authenticated user
  User? get currentUser => _auth.currentUser;

  /// ✅ Anonymous Sign-Up (Auto-generated username handled separately)
  Future<User?> signUpAnonymously() async {
    try {
      return (await _auth.signInAnonymously()).user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error (Anonymous Sign-up): ${e.message}');
      return null;
    } catch (e) {
      print('Error signing up anonymously: $e');
      return null;
    }
  }

  /// ✅ Sign-Up with Email & Password
  Future<User?> signUpWithEmail(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      print("Error: Email and password cannot be empty.");
      return null;
    }
    try {
      return (await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ))
          .user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error (Sign-up): ${e.message}');
      return null;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  /// ✅ Sign-In with Email & Password
  Future<User?> signInWithEmail(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      print("Error: Email and password cannot be empty.");
      return null;
    }
    try {
      return (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ))
          .user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error (Sign-in): ${e.message}');
      return null;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  /// ✅ Google Sign-in (Handles Account Linking)
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Google sign-in cancelled.');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await _auth.signInWithCredential(credential)).user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error (Google Sign-in): ${e.message}');
      return null;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  /// ✅ Reset Password (With User Notification)
  Future<void> resetPassword(String email) async {
    if (email.trim().isEmpty) {
      print("Error: Email cannot be empty.");
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      print('✅ Password reset email sent to $email.');
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error (Password Reset): ${e.message}');
    } catch (e) {
      print('Error resetting password: $e');
    }
  }

  /// ✅ Logout (Ensures Sign-Out from All Sessions)
  Future<void> logout() async {
    try {
      await _googleSignIn.signOut(); // ✅ Ensure Google logout first
      await _auth.signOut();
      print('✅ User logged out successfully.');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}

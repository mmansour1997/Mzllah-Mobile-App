import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../classes/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Auth with ChangeNotifier {
  String _token;
  String _refreshToken;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null &&
        _refreshToken != null) {
      return _token;
    }
    refreshSession();
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<Map<String, dynamic>> getData(String token, String userId) async {
    final urlstore = Uri.parse(
        'https://mzllahapp-default-rtdb.firebaseio.com/userData.json?auth=$token&orderBy="userId"&equalTo="$userId"');
    final response = await http.get(urlstore);
    final Map extractedData =
        json.decode(response.body) as Map<String, dynamic>;

    return extractedData;
  }

  Future<Map<String, dynamic>> getCode() async {
    final urlstore = Uri.parse(
        'https://qrcodeapp-49c26-default-rtdb.firebaseio.com/code.json');
    final response = await http.get(urlstore);
    final Map extractedData =
        json.decode(response.body) as Map<String, dynamic>;

    return extractedData;
  }

  Future<UserCredential> signup(String firstName, String lastName, String phone,
      String date, String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final database = FirebaseDatabase.instance.reference();
    String newkey = database.reference().child("userData").push().key;
    int points = 0;
    int totalPoints = 0;
    try {
      await database.child('userData/$newkey').set({
        'userId': _auth.currentUser.uid,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'birthDate': date,
        'points': points.toString(),
        'totalPoints': totalPoints.toString()
      });
    } catch (error) {
      throw error;
    }
    return userCredential;
  }

  Future<UserCredential> login(String email, String password) async {
    Future<UserCredential> userCredential =
        _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _refreshToken = extractedUserData['refresh_token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  void logout() async {
    FirebaseAuth.instance.signOut();
    _token = null;
    _refreshToken = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    // if (_authTimer != null) {
    //   _authTimer.cancel();
    // }
    // final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    // _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> refreshSession() async {
    final String webkey = 'AIzaSyAdQsDPi1OIa35fB-JQHeGTaPFyjkaXx3E';
    final url =
        Uri.parse('https://securetoken.googleapis.com/v1/token?key=$webkey');

    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          'grant_type=refresh_token&refresh_token=$_refreshToken', // Your refresh token.
        },
        // Or try without json.encode.
        // Like this:
        // body: {
        //   'grant_type': 'refresh_token',
        //   'refresh_token': '[REFRESH_TOKEN]',
        // },
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['id_token'];
      _refreshToken =
          responseData['refresh_token']; // Also save your refresh token
      _userId = responseData['user_id'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expires_in'])));
      _autoLogout();

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'refresh_token': _refreshToken,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String(),
      });
      prefs.setString('userData', userData);
    } catch (error) {
      if (!(error.toString().contains("MISSING_GRANT_TYPE") ||
          error.toString().contains("MissingPluginException") ||
          error.toString().contains("Invalid argument") ||
          error.toString().contains("Unhandled Exception"))) {
        throw error;
      }
    }
  }
}

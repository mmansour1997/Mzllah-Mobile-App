import 'package:flutter/material.dart';
import '../classes/http_exception.dart';
import '../classes/entry.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class Entries with ChangeNotifier {
  String authToken;
  String userId;

  Entries(this.authToken, this.userId, this._items);
  List<Entry> _items = [];

  List<Entry> get items {
    return [..._items];
  }

  Entry findById(String id) {
    return _items.firstWhere((entry) => entry.id == id);
  }

  String determinebrewed(int x) {
    switch (x) {
      case 0:
        return 'Unknown';
        break;
      case 1:
        return 'Press';
        break;
      case 2:
        return 'Drip';
        break;
      case 3:
        return 'Percolator';
        break;
      case 4:
        return 'Espresso';
        break;
      case 5:
        return 'Vacuum';
        break;
      case 6:
        return 'Pour-over';
        break;
      case 7:
        return 'Turkish';
        break;
      case 8:
        return 'Cupping';
        break;
      default:
        return '';
    }
  }

  Future<void> fetchAndSetEntries() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = _auth.currentUser;
    final uid = user.uid;

    if (user != null) {
      authToken = await user.getIdToken();
    }

    userId = uid;
    final url = Uri.parse(
        'https://mzllahapp-default-rtdb.firebaseio.com/entries.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Entry> loadedEntries = [];
      if (extractedData != null) {
        extractedData.forEach((entId, entData) {
          loadedEntries.add(Entry(
            id: entId,
            title: entData['title'],
            producer: entData['producer'],
            origin: entData['origin'],
            roaster: entData['roaster'],
            roastdate: entData['roastdate'],
            grind: entData['grind'],
            price: entData['price'],
            brewed: entData['brewed'],
            location: entData['location'],
            date: DateTime.parse(entData['date']),
            time: DateTime.parse(entData['time']),
            dose: entData['dose'],
            mass: entData['mass'],
            temp: entData['temp'],
            exmin: entData['exmin'],
            exsec: entData['exsec'],
            tds: entData['tds'],
            exyield: entData['exyield'],
            rating: entData['rating'],
            notes: entData['notes'],
            body: entData['body'],
            citrus: entData['citrus'],
            berry: entData['berry'],
            floral: entData['floral'],
            spice: entData['spice'],
            smoke: entData['smoke'],
            nut: entData['nut'],
            chocolate: entData['chocolate'],
            caramel: entData['caramel'],
            sweet: entData['sweet'],
            sour: entData['sour'],
            bitter: entData['bitter'],
            salt: entData['salt'],
            finish: entData['finish'],
          ));
        });
        _items = loadedEntries;
        notifyListeners();
      }
    } catch (error) {
      _items = null;
      notifyListeners();
    }
  }

  Future<void> addEntry(Entry _editedentry, int _selectedBrew) async {
    final url = Uri.parse(
        'https://mzllahapp-default-rtdb.firebaseio.com/entries.json?auth=$authToken');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': _editedentry.title,
            'producer': _editedentry.producer,
            'origin': _editedentry.origin,
            'roaster': _editedentry.roaster,
            'roastdate': _editedentry.roastdate,
            'grind': _editedentry.grind,
            'price': _editedentry.price,
            'brewed': _selectedBrew,
            'location': _editedentry.location,
            'date': _editedentry.date.toIso8601String(),
            'time': _editedentry.time.toIso8601String(),
            'dose': _editedentry.dose,
            'mass': _editedentry.mass,
            'temp': _editedentry.temp,
            'exmin': _editedentry.exmin,
            'exsec': _editedentry.exsec,
            'tds': _editedentry.tds,
            'exyield': _editedentry.exyield,
            'rating': _editedentry.rating,
            'notes': _editedentry.notes,
            'body': _editedentry.body,
            'citrus': _editedentry.citrus,
            'berry': _editedentry.berry,
            'floral': _editedentry.floral,
            'spice': _editedentry.spice,
            'smoke': _editedentry.smoke,
            'nut': _editedentry.nut,
            'chocolate': _editedentry.chocolate,
            'caramel': _editedentry.caramel,
            'sweet': _editedentry.sweet,
            'sour': _editedentry.sour,
            'bitter': _editedentry.bitter,
            'salt': _editedentry.salt,
            'finish': _editedentry.finish,
            'creatorId': userId,
          }));
      final newentry = Entry(
        id: json.decode(response.body)['name'],
        title: _editedentry.title,
        producer: _editedentry.producer,
        origin: _editedentry.origin,
        roaster: _editedentry.roaster,
        roastdate: _editedentry.roastdate,
        grind: _editedentry.grind,
        price: _editedentry.price,
        brewed: _selectedBrew,
        location: _editedentry.location,
        date: _editedentry.date,
        time: _editedentry.time,
        dose: _editedentry.dose,
        mass: _editedentry.mass,
        temp: _editedentry.temp,
        exmin: _editedentry.exmin,
        exsec: _editedentry.exsec,
        tds: _editedentry.tds,
        exyield: _editedentry.exyield,
        rating: _editedentry.rating,
        notes: _editedentry.notes,
        body: _editedentry.body,
        citrus: _editedentry.citrus,
        berry: _editedentry.berry,
        floral: _editedentry.floral,
        spice: _editedentry.spice,
        smoke: _editedentry.smoke,
        nut: _editedentry.nut,
        chocolate: _editedentry.chocolate,
        caramel: _editedentry.caramel,
        sweet: _editedentry.sweet,
        sour: _editedentry.sour,
        bitter: _editedentry.bitter,
        salt: _editedentry.salt,
        finish: _editedentry.finish,
      );

      _items.add(newentry);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateEntry(String id, Entry _editedentry, int brew) async {
    final entIndex = _items.indexWhere((entry) => entry.id == id);
    if (entIndex >= 0) {
      final url = Uri.parse(
          'https://mzllahapp-default-rtdb.firebaseio.com/entries/$id.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': _editedentry.title,
            'producer': _editedentry.producer,
            'origin': _editedentry.origin,
            'roaster': _editedentry.roaster,
            'roastdate': _editedentry.roastdate,
            'grind': _editedentry.grind,
            'price': _editedentry.price,
            'brewed': brew,
            'location': _editedentry.location,
            'date': _editedentry.date.toIso8601String(),
            'time': _editedentry.time.toIso8601String(),
            'dose': _editedentry.dose,
            'mass': _editedentry.mass,
            'temp': _editedentry.temp,
            'exmin': _editedentry.exmin,
            'exsec': _editedentry.exsec,
            'tds': _editedentry.tds,
            'exyield': _editedentry.exyield,
            'rating': _editedentry.rating,
            'notes': _editedentry.notes,
            'body': _editedentry.body,
            'citrus': _editedentry.citrus,
            'berry': _editedentry.berry,
            'floral': _editedentry.floral,
            'spice': _editedentry.spice,
            'smoke': _editedentry.smoke,
            'nut': _editedentry.nut,
            'chocolate': _editedentry.chocolate,
            'caramel': _editedentry.caramel,
            'sweet': _editedentry.sweet,
            'sour': _editedentry.sour,
            'bitter': _editedentry.bitter,
            'salt': _editedentry.salt,
            'finish': _editedentry.finish,
          }));
      _items[entIndex] = _editedentry;
    } else {
      print('...');
    }
    notifyListeners();
  }

  Future<void> deleteEntry(String id) async {
    final url = Uri.parse(
        'https://mzllahapp-default-rtdb.firebaseio.com/entries/$id.json?auth=$authToken');
    final existingEntryIndex = _items.indexWhere((ent) => ent.id == id);
    var existingEntry = _items[existingEntryIndex];
    _items.removeAt(existingEntryIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingEntryIndex, existingEntry);
      notifyListeners();
      throw HttpException('Could not delete entry.');
    }
    existingEntry = null;
  }
}

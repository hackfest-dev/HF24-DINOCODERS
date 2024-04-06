import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
  }

  void addToCart(DocumentReference value) {
    _cart.add(value);
  }

  void removeFromCart(DocumentReference value) {
    _cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    _cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[index] = updateFn(_cart[index]);
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    _cart.insert(index, value);
  }

  double _cartsum = 0.0;
  double get cartsum => _cartsum;
  set cartsum(double value) {
    _cartsum = value;
  }
}

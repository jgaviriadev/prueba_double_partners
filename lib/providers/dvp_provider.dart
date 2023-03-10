import 'package:flutter/material.dart';
import 'package:prueba_double_partners/models/user.dart';

import '../models/validation_item.dart';

class DVPProvider extends ChangeNotifier{

  ValidationItem<String> _name = ValidationItem<String>(null, null);
  ValidationItem<String> _lastName = ValidationItem<String>(null, null);
  ValidationItem<DateTime> _dob = ValidationItem<DateTime>(null, null);
  List<ValidationItem<String>> _listAddress = [ValidationItem<String>(null, null)];
  List<Address> _addresses = [];
  User? _user;

  ValidationItem<String> get name => _name;
  ValidationItem<String> get lastName => _lastName;
  ValidationItem<DateTime> get dob => _dob;
  List<ValidationItem<String>> get listAddress => _listAddress;
  User? get user => _user;

  bool get buttonRegister {
    if (_name.value != null && _lastName.value != null && _dob.error == null && _dob.value !=null && validateAdress()) {
      return true;
    } else {
      return false;
    }
  }
  
  void changeName(String value) {
    if (value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(null, "Campo obligatorio");
    }
    notifyListeners();
  }

  void changeLastName(String value) {
    if (value.isNotEmpty) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Campo obligatorio");
    }
    notifyListeners();
  }

  void changeDob(DateTime value) {
    int age;
    int dob = value.year;
    DateTime today = DateTime.now();
    int currentYear = today.year;
    age = currentYear - dob;
    if (age >= 18) {
      _dob = ValidationItem(value, null);
    } else {
      _dob = ValidationItem(value, 'Debe tener más de 18 años');
    }
    notifyListeners();
  }

  void changeAddress(String value, int index) {
    if (value.isNotEmpty) {
      _listAddress[index] = ValidationItem(value, null);
    } else {
      _listAddress[index] = ValidationItem(null, "Campo obligatorio");
    }
    notifyListeners();
  }

  void chnageNumberAddress() {
    _listAddress += [ValidationItem<String>(null, null)];
    notifyListeners();
  }

  bool validateAdress() {
    bool test = true;
    for(ValidationItem<String> item in _listAddress){
      if(item.value==null){
        test = false;
      }else {
        _addresses += [Address(address: item.value!)];
      }
    }
    return test;
  }

  void onRegister() {
    _user = User(
      name: 'Jhonatan', 
      lastname: 'Gaviria', 
      birthday: DateTime.now(), 
      addresses: _addresses
    );
  }

  void showToast (context, String txt, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(txt)
      )
    );
  }
}
// ignore_for_file: avoid_print

class Person {
  Person() {
    print("I'am person constractor");
  }
  int? _age;
  String? _name;

  Person.personConsrarctor2(this._name, this._age) {
    print("I'am personConstractor 2222");
  }

  void setAge(int age) {
    _age = age;
  }

  int? getAge() {
    return _age;
  }

  void setName(String name) {
    _name = name;
  }

  String? getName() {
    return _name;
  }

  void eat() {
    print("I'am eating");
  }
}

class Boy extends Person { 
  Boy() {
    
    print("I'am Boy constractor");
  }
  @override
  void eat() {
    super.eat();
    print("I'am boy");
  }
}

class Girl extends Person {
  Girl() {
    print("I'am Girl Constractor");
  }
}

void main() {
  final Map<String, String> gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };
  final Map<int, String> nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  mhs2[2]  = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';

  print(mhs1); 
  print(mhs2); 
}
void main() {

  // ── Langkah 1 ───────────────────────────────────────────────────────────────
  List<int?> list1 = [1, 2, 3];
  var list2 = [0, ...list1];        
  print('list1       : $list1');    
  print('list2       : $list2');    
  print('list2 length: ${list2.length}'); 

  // ── Langkah 3 ───────────────────────────────────────────────────────────────
  list1 = [1, 2, null];
  print('list1 (baru): $list1');    

  var list3 = [0, ...?list1];
  print('list3       : $list3');    
  print('list3 length: ${list3.length}'); 

  final nimDigits = [2, 3, 4, 1, 7, 2, 0, 1, 8, 4]; 
  final myNimList = ['NIM:', ...nimDigits];
  print('myNimList   : $myNimList'); 

  // ── Langkah 4 ───────────────────────────────────────────────────────────────
  bool promoActive = true;
  var navTrue = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('nav (promo=true) : $navTrue');

  promoActive = false;
  var navFalse = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('nav (promo=false): $navFalse');

  // ── Langkah 5 ───────────────────────────────────────────────────────────────
  var login = 'Manager';
  var nav2Manager = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('nav2 (Manager): $nav2Manager');

  login = 'Staff';
  var nav2Staff = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('nav2 (Staff)  : $nav2Staff');

  login = 'Guest';
  var nav2Guest = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('nav2 (Guest)  : $nav2Guest');

  // ── Langkah 6 ───────────────────────────────────────────────────────────────
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print('listOfStrings: $listOfStrings'); 
}

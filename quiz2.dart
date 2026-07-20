abstract class MenuItem {
  double price();
  final String name;
  final double basePrice;
  static int itemCount = 0;
  MenuItem(this.name, this.basePrice){
    itemCount++;
  }

  void show(){
    print('$name - ${price()} บาท');
  }
}
class Drink extends MenuItem{
  final int toppings;
  Drink(String name, double basePrice, this.toppings):super(name,basePrice);
  
  @override
  double price(){
    return basePrice + (10 * toppings);
  }
}
class Food extends MenuItem{
  final String size;
  Food(String name, double basePrice, this.size):super(name, basePrice);

  @override
  double price(){
    double multiplier = 1.0;

    switch (size.toUpperCase()){
      case 'S':
        multiplier = 1.0;
        break;
      case 'M':
        multiplier = 1.2;
        break;
      case 'L':
        multiplier = 1.5;
        break;
    }
    return basePrice * multiplier;
  }
}
enum OrderStatus {pending, paid, cancelled}
void main(){
  List<MenuItem> show = [Drink('ลาเต้', 55, 1), Food('ข้าวผัด', 60, 'L'), Drink('อเมริกาโน่', 45, 0)];
  double totalAmount = 0.0;
  for (var item in show) {
    item.show();
    totalAmount += item.price();
  }
  print('ยอดรวมทั้งสิ้น: $totalAmount บาท');
  print('---');
  Wallet wallet = Wallet();
  wallet.balance = -10;
  wallet.pay(100.0);
  print('ชำระเงินสำเร็จ');
  print('สถานะ: ชำระเงินแล้ว');
  print('ยอดเงินคงเหลือ: ${wallet.balance} บาท');
  print('ยอดเงินไม่พอ');
  print('สถานะ: รอชำระเงิน');
  print('ยอดเงินคงเหลือ: ${wallet.balance} บาท');
  print('---');
  OrderStatus status = OrderStatus.pending;
  switch (status) {
    case OrderStatus.pending:
      print('รอชำระเงิน');
      break;
    case OrderStatus.paid:
      print('ชำระเงินแล้ว');
      break;
    case OrderStatus.cancelled:
      print('ยกเลิกคำสั่งซื้อ');
      break;
  }
  print('---');
  print('จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}');
}
class Wallet {
  double _balance = 0;
  double get balance =>  _balance;

  set balance(double amount){
    if (amount < 0){
      print('ผิดพลาด: ยอดเงินติดลบไม่ได้');
    }else {
      _balance = amount;
    }
  }
  void pay(double amount){
    if (amount > 0) _balance += amount;
  }
}
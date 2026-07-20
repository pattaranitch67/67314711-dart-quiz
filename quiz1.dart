const double vatRate = 0.07;
void main(){
  final String shopname = 'Dart Cafe';
  print('ร้าน: $shopname');
  print('อัตราภาษี (vatRate): $vatRate');
  print('---');
  List<String> categories = ['เครื่องดื่ม', 'ของคาว', 'ของหวาน'];
  Map<String,int> menu = {'ลาเต้': 55, 'ข้าวผัด': 60, 'บิงซู': 45, 'กาแฟ': 50};
  print('หมวดเมนู: ${categories}');
  print('จำนวนเมนูทั้งหมด: ${menu.length} รายการ');
  print('ราคาลาเต้: ${menu['ลาเต้']} บาท');
  print('---');
  print('เมนูราคาตั้งแต่ 50 บาทขึ้นไป:');
  for (var item in menu.entries){
    if (item.value > 50){
      print('${item.key} : ${item.value} บาท');
    }
  }
  print('---');
  calcTotal();
  print('---');
  String? coupon;
  int couponlength = coupon?.length ?? 0;
  print('ความยาวคูปอง: $couponlength');
  coupon ??= 'NO-COUPON';
  print('คูปองหลังกำหนดค่า: $coupon');
}
void calcTotal(){
  double multiply(int price, int qty, double discount){
    return (price * qty - discount) * (1 + vatRate);
  }
  double totalNodiscount = multiply(55, 2, 0);
  double totaldiscount = multiply(55, 2, 10);
  print('ยอดสุทธิ (ไม่มีส่วนลด): ${totalNodiscount} บาท');
  print('ยอดสุทธิ (ส่วนลด 10 บาท): ${totaldiscount} บาท');
}
Future<Map<String, dynamic>> fetchOrder(int orderId) async{
  if (orderId <= 0){
    throw Exception('รหัสคำสั่งซื้อไม่ถูกต้อง');
  }
  await Future.delayed(Duration(seconds: 2));
  return {
    'id': orderId, 
    'menu': 'ลาเต้',
    'total': 65.0
  };
}
void main() async{
  print('เริ่มโหลดข้อมูล...');
  try {
    var Order = await fetchOrder(7);
    print('ได้รับข้อมูลออร์เดอร์: {id: ${Order['id']}, menu: ${Order['menu']}, total: ${Order['total']}}');
  } catch (e){
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('จบรายการ');
  }
  print('---');
  
 try {
    var Order = await fetchOrder(0);
    print('ได้รับข้อมูลออร์เดอร์: {id: ${Order['id']}, menu: ${Order['menu']}, total: ${Order['total']}}');
  } catch (e){
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('จบรายการ');
  }
  print('---');

  await for (String trackorder in trackOrder()){
    print(trackorder);
  }
  print('ติดตามสถานะเสร็จสิ้น');
}
Stream<String> trackOrder() async*{
  await Future.delayed(Duration(seconds: 1));
  yield 'สถานะ: รับออร์เดอร์แล้ว';
  await Future.delayed(Duration(seconds: 1));
  yield 'สถานะ: กำลังจัดทำ';
  await Future.delayed(Duration(seconds: 1));
  yield 'สถานะ: จัดส่งเรียบร้อย';
}
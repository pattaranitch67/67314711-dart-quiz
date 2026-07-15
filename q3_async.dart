Future<int> fetchOrder(){
    return Future.delayed(Duration(seconds: 2), () => 7 );


}

void main() async {
    print("เริ่มโหลดข้อมูล...");
//    int order = await fetchOrder();
    print('---');
    print("ได้รับข้อมูลออร์เดอร์:");
    await for (String order in trackOrder()){
        print(order);
    }
    print("ติดตามสถานะเสร็จสิ้น");
}
Stream<String> trackOrder() async* {
    await Future.delayed(Duration(seconds: 1));
    yield 'สถานะ: รับออร์เดอร์แล้ว';
    await Future.delayed(Duration(seconds: 1));
    yield 'สถานะ: กำลังจัดส่ง';
    await Future.delayed(Duration(seconds: 1));
    yield 'สถานะ: จัดส่งเรียบร้อย';
}
//output
//เริ่มโหลดข้อมูล...
//---
//ได้รับข้อมูลออร์เดอร์:
//สถานะ: รับออร์เดอร์แล้ว
//สถานะ: กำลังจัดส่ง
//สถานะ: จัดส่งเรียบร้อย
//ติดตามสถานะเสร็จสิ้น
abstract class MenuItem{
    double price();

    String name;
    double basePrice;
    MenuItem(this.name, this.basePrice);
    void show(){
        print('${name} - ${basePrice} บาท ');
    }
}
class Drink extends MenuItem{
    int topping;
    Drink(this.topping) : super(name, baseprice);
}
class Food extends MenuItem{
    String size;
    Food(this.size):super(name, baseprice);
}

class Wallet{
    double balance = 0.0;
    double get _balance => balance;
}

void main(){

}
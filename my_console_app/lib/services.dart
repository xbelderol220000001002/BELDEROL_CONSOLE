import 'models.dart';

class MotorcycleService {
  final List<Motorcycle> _motorcycles = [
    Motorcycle(id: '1', model: 'Harley Davidson', price: 15000),
    Motorcycle(id: '2', model: 'Yamaha MT-07', price: 7500),
    Motorcycle(id: '3', model: 'Ducati Monster', price: 12000),
  ];

  List<Motorcycle> getMotorcycles() => List.unmodifiable(_motorcycles);

  Motorcycle getMotorcycleById(String id) {
  return _motorcycles.firstWhere(
    (moto) => moto.id == id,
    orElse: () => Motorcycle(id: 'default', model: 'Not Found', price: 0),
  );
}
}

class CartService {
  final List<CartItem> _cart = [];

  void addToCart(Motorcycle motorcycle, int quantity) {
    _cart.add(CartItem(motorcycle: motorcycle, quantity: quantity));
  }

  List<CartItem> getCart() => List.unmodifiable(_cart);

  double checkout() {
    double total = _cart.fold(0, (sum, item) => sum + (item.motorcycle.price * item.quantity));
    _cart.clear(); // Clear cart after checkout
    return total;
  }
}
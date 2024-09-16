class Motorcycle {
  final String id;
  final String model;
  final double price;

  Motorcycle({
    required this.id,
    required this.model,
    required this.price,
  });

  @override
  String toString() {
    return 'Motorcycle(id: $id, model: $model, price: \$$price)';
  }
}

class CartItem {
  final Motorcycle motorcycle;
  final int quantity;

  CartItem({
    required this.motorcycle,
    required this.quantity,
  });
}

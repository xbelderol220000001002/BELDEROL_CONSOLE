import 'dart:io';
  import 'package:riverpod/riverpod.dart';
  import 'package:my_console_app/providers.dart';
  


  final container = ProviderContainer();
  final motorcycleService = container.read(motorcycleServiceProvider);
  final cartService = container.read(cartServiceProvider);

  void main() {
    print('Welcome to the Online Motorcycle Shop');
    print('1. List Available Motorcycles');
    print('2. View Cart');
    print('3. Add Motorcycle to Cart');
    print('4. Checkout');
    print('5. Exit');

    while (true) {
      stdout.write('Choose an option: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          listMotorcycles();
          break;
        case '2':
          viewCart();
          break;
        case '3':
          addMotorcycleToCart();
          break;
        case '4':
          checkout();
          break;
        case '5':
          return;
        default:
          print('Invalid option');
      }
    }
  }

  void listMotorcycles() {
    print('Available Motorcycles:');
    for (var moto in motorcycleService.getMotorcycles()) {
      print(moto);
    }
  }

  void viewCart() {
    print('Your Cart:');
    for (var item in cartService.getCart()) {
      print('${item.motorcycle.model} x${item.quantity}');
    }
  }

  void addMotorcycleToCart() {
    stdout.write('Enter Motorcycle ID: ');
    final id = stdin.readLineSync() ?? '';

    final motorcycle = motorcycleService.getMotorcycleById(id);
    stdout.write('Enter quantity: ');
    final quantity = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    cartService.addToCart(motorcycle, quantity);
    print('${motorcycle.model} added to cart.');
  }

  void checkout() {
    final total = cartService.checkout();
    print('Thank you for your purchase! Total amount: \$$total');
  }
import 'package:riverpod/riverpod.dart';
import 'services.dart';

final motorcycleServiceProvider = Provider<MotorcycleService>((ref) {
  return MotorcycleService();
});

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService();
});
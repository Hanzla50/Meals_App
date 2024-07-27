import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

final mealsProvider = Provider((ref) { // we can make Provider this way becoz here is a simple static dummmy data which will not change. 
  return dummyMeals;
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state, meal];    // "..." this is spread operator which pull out all the elements which are already present in list and add them individual element to new list. 
      return true;    
    }  
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) { //In angular bracket first pass the class name as a notifier then type which they return in the end like list of meals in this case.
  return FavoriteMealsNotifier();

});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegatarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({ //they cannot null becoz initially they all set to false. 
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegatarian: false,
    Filter.vegan: false,
  }); 

  void setFilters(Map<Filter, bool> chosenFilters) {
    state =   chosenFilters;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }

}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegatarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList(); 
});
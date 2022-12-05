abstract class DetailsMealsState{}
class initialDetailMealsState extends DetailsMealsState{}
class ChangeCartCountState extends DetailsMealsState{}
class IncrementCountCartState extends DetailsMealsState{}
class DecrementCountCartState extends DetailsMealsState{}
class AddAmountToCartState extends DetailsMealsState{}
class GetCurrentLocationSuccessState extends DetailsMealsState{}
class GetCurrentLocationErrorState extends DetailsMealsState{
  String error;
  GetCurrentLocationErrorState(this.error);

}

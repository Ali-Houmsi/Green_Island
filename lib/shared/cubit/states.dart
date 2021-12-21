abstract class AppStates{}
class AppInitialStates extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}
class CheckPassword extends AppStates{}
class ErrorPassword extends AppStates{
   String error;
  ErrorPassword(this.error);
}







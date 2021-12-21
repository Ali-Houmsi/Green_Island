import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates>{
HomeCubit():super(HomeInitialtState());
//هيك صار فيني استدعيه بكل التطبيق بأي مكان 
///to be more easily when use this cubit  in many place 
///create object from bloc
static HomeCubit get(context) =>BlocProvider.of(context);
}
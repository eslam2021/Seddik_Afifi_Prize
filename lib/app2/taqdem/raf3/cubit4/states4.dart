abstract class Raf3tStates {}

class Raf3InitialState extends Raf3tStates {}

class Raf3LoadingState extends Raf3tStates {}

class Raf3RefreshState extends Raf3tStates {}

class SelectSpecialistChangeState extends Raf3tStates {}

class SelectGenderChangeState extends Raf3tStates {}

class Raf3SuccessState extends Raf3tStates {}

class Raf3ErrorState extends Raf3tStates {
  final String error;

  Raf3ErrorState(this.error);
}

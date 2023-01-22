abstract  class CounterStates {}

class InitialCounterState extends CounterStates
{


}

class PlusCounterState extends CounterStates{
  late final int  counter;
  PlusCounterState(this.counter);
}

class MinusCounterState extends CounterStates{
  late final int  counter;

  MinusCounterState(this.counter);
}
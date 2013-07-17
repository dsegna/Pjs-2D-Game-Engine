/**
 * InputInteractors are interactors that can handle input.
 * They are identical to a Player, just named separately for sanity
 */
abstract class InputInteractor extends Interactor {

  // simple constructor
  InputInteractor(String name) { super(name); }

  // full constructor
  InputInteractor(String name, float dampening_x, float dampening_y) {
    super(name, dampening_x, dampening_y); }
}
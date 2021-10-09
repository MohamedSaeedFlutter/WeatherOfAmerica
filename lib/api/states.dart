abstract class ChangState<State> {}

class InitialState extends ChangState {}

class SearchState extends ChangState {}

class GetUrlState extends ChangState {}

class PostUrlState extends ChangState {}

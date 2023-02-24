abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsChangeScreenState extends NewsStates{}

//BUSINESS
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
final String error;
NewsGetBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}

// SPORTS
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
final String error;
NewsGetSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}

//SCIENCE
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
final String error;
NewsGetScienceErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsStates{}

//search
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}

class NewsreloadingState extends NewsStates{}

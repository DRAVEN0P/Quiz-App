class QuizQuestion{
  QuizQuestion(this.text, this.ans);
  final String text;
  final List<String> ans;

  List<String> getSuffeledAnswer(){
    final sufferList = List.of(ans);
    sufferList.shuffle();
    return sufferList;
  }

}
///並び替え用
enum Sort {
  stars,
  forks,
  helpWantedIssues,
  updated,
  empty,
}

String change(Sort value) {
  switch (value) {
    case Sort.empty:
      return "";
    case Sort.forks:
      return "forks";
    case Sort.stars:
      return "stars";
    case Sort.helpWantedIssues:
      return "help-wanted-issues";
    case Sort.updated:
      return "updated";
  }
}

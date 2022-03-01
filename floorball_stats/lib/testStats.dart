



final List<String> teamsList = <String>['Mölndal IBF', 'Pixbo Wallenstam', 'Hovslätt IK', 'Jönköpings IK', 'Barnarps IF', 'Guldhedens IK', 'IK Zenith', 'Burås IK', 'Kärra IBK', 'Stenugnsunds IBK', 'FBC Vinga', 'IBF Backadalen'];

Map<String,List<String>> teams = {};

void testStats() {
  for (String team in teamsList) {
    List<String> opponents = [];
    for (String opp in teamsList) {
      if (opp != team){
        opponents.add(opp);
      }
    }
    teams[team] =  opponents;
  }
}

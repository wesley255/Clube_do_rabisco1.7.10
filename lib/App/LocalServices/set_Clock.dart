class ClockRemainingTime {
  static String getdifferenceTime({required DateTime dateTime}) {
    /*----------------------\/--[cache]--\/------------------------*/
    String _formart(int value) => '$value'.padLeft(2, '0');
    Duration resut = DateTime.now().difference(dateTime);
    bool ativo = DateTime.now().isBefore(dateTime);
    /*----------------------/\--[cache]--/\------------------------*/
    if (ativo) {
      String dia = _formart(resut.inDays * -1);
      String hora = _formart(resut.inHours.remainder(24) * -1);
      String minuto = _formart(resut.inMinutes.remainder(60) * -1);
      String segundo = _formart(resut.inSeconds.remainder(60) * -1);
      return '${dia}d : ${hora}h : ${minuto}m : ${segundo}s';
    } else {
      return 'Finalizado!';
    }
  }

  static DateTime getFuturedata({required Duration addtime}) {
    int timenow = DateTime.now().millisecondsSinceEpoch;
    return DateTime.fromMillisecondsSinceEpoch(
      timenow + addtime.inMilliseconds,
    );
  }
}

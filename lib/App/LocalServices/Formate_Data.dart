formatData() {
  Map<int, String> textManth;
  String ano = DateTime.now().year.toString().substring(2, 4);
  String horario = '${DateTime.now().hour}'.padLeft(2, '0') +
      '${DateTime.now().minute}'.padLeft(2, '0');
  textManth = {
    1: 'Jan',
    2: 'Fev',
    3: 'Mar',
    4: 'Abr',
    5: 'Mai',
    6: 'Jun',
    7: 'Jul',
    8: 'Ago',
    9: 'Set',
    10: 'out',
    11: 'Nov',
    12: 'Dez'
  };
  Map i = {
    'hora': horario,
    'data': '${textManth[DateTime.now().month]}/$ano',
  };
  return i;
}

abstract class FormarDataContrect {
  String formateDate({required DateTime data});
}

class FormatDateTime implements FormarDataContrect {
  final Map<int, String> _textManth = {
    1: 'Jan',
    2: 'Fev',
    3: 'Mar',
    4: 'Abr',
    5: 'Mai',
    6: 'Jun',
    7: 'Jul',
    8: 'Ago',
    9: 'Set',
    10: 'out',
    11: 'Nov',
    12: 'Dez'
  };

  @override
  formateDate({required DateTime data}) {
    String thisDataMes = (_textManth[data.month]!).padLeft(2, '0');
    String thisDataDay = (data.day.toString()).padLeft(2, '0');
    String thisHora = (data.hour.toString()).padLeft(2, '0');
    String thisMenute = (data.minute.toString()).padLeft(2, '0');

    if (DateTime.now().day == data.day &&
        DateTime.now().month == data.month &&
        DateTime.now().year == data.year) {
      return 'Hoje as $thisHora:$thisMenute';
    } else if (DateTime.now().day == data.day + 1 &&
        DateTime.now().month == data.month &&
        DateTime.now().year == data.year) {
      return 'Ontem as $thisHora:$thisMenute';
    } else {
      return ('$thisHora:$thisMenute $thisDataMes $thisDataDay,${data.year.toString().substring(
            2,
          )}');
    }
  }
}

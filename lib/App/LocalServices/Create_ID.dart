criateID() {
  formatarInt(int i, int lenth) {
    return i.toString().padLeft(lenth, '0');
  }

  String idglobal = DateTime.now().year.toString();
  int milleseconds = DateTime.now().millisecond;
  int second = DateTime.now().second;
  int minute = DateTime.now().minute;
  int hora = DateTime.now().hour;
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  //
  idglobal = idglobal + formatarInt(month, 2);
  idglobal = idglobal + formatarInt(day, 2);
  idglobal = idglobal + formatarInt(hora, 2);
  idglobal = idglobal + formatarInt(minute, 2);
  idglobal = idglobal + formatarInt(second, 2);
  idglobal = idglobal + formatarInt(milleseconds, 3);
  return (idglobal);
}

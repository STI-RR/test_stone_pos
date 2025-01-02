class DateUtil {
  /// Formats a [DateTime] to a string with the format 'dd/MM/yyyy'
  static String getFormattedDate(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  /// Formats a [DateTime] to a string with the format 'HH:mm:ss'
  static String getFormattedTime(DateTime dateTime) {
    final hora = dateTime.hour.toString().padLeft(2, '0');
    final minuto = dateTime.minute.toString().padLeft(2, '0');
    final segundo = dateTime.second.toString().padLeft(2, '0');

    return "$hora:$minuto:$segundo";
  }

  /// Formats a [DateTime] to a string with the format 'dd/MM/yyyy HH:mm:ss'
  static String getFormattedDateTime(DateTime dateTime) {
    final dia = dateTime.day.toString().padLeft(2, '0');
    final mes = dateTime.month.toString().padLeft(2, '0');
    final ano = dateTime.year.toString().padLeft(4, '0');

    final hora = dateTime.hour.toString().padLeft(2, '0');
    final minuto = dateTime.minute.toString().padLeft(2, '0');
    final segundo = dateTime.second.toString().padLeft(2, '0');

    return "$dia/$mes/$ano $hora:$minuto:$segundo";
  }

  // Format in pt_BR: 21 Set. 2023 - 14:30
  static String getFormattedDateTimeWithMonthAbbreviated(DateTime dateTime) {
    final dia = dateTime.day.toString().padLeft(2, '0');
    final mes = _getMesAbreviado(dateTime.month);
    final ano = dateTime.year.toString().padLeft(4, '0');

    final hora = dateTime.hour.toString().padLeft(2, '0');
    final minuto = dateTime.minute.toString().padLeft(2, '0');

    return "$dia $mes. $ano - $hora:$minuto";
  }

  static String _getMesAbreviado(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Fev';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'Mai';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Set';
      case 10:
        return 'Out';
      case 11:
        return 'Nov';
      case 12:
        return 'Dez';
      default:
        return '';
    }
  }

  /// Formats a [DateTime] to a string with the format 'dd dias HH hora e mm min atrás'
  static String getFormattedTimeAgo(DateTime dateTime, {DateTime? overrideNow}) {
    final now = overrideNow ?? DateTime.now();
    final millisecondsPast = now.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;
    final difference = DateTime.fromMillisecondsSinceEpoch(millisecondsPast, isUtc: true);

    String formatted = "";

    // DateTime (1970-01-01 00:00:00) significa 0 minutos atrás
    // DateTime (1970-01-01 00:01:00) significa 1 minuto atrás
    // DateTime (1970-01-01 00:02:00) significa 2 minutos atrás
    final firstMinute = DateTime.utc(1970, 1, 1, 0, 1, 0);
    if (difference.isBefore(firstMinute)) {
      return "Agora";
    }

    if (difference.day > 1) {
      if (difference.day > 2) {
        formatted += "${difference.day - 1} dias ";
      } else {
        formatted += "${difference.day - 1} dia ";
      }
      if (difference.hour > 0 && difference.minute > 0) {
        formatted = formatted.substring(0, formatted.length - 1);
        formatted += ", ";
      } else if (difference.hour > 0 || difference.minute > 0) {
        formatted += "e ";
      }
    }
    if (difference.hour > 0) {
      if (difference.hour > 1) {
        formatted += "${difference.hour} horas ";
      } else {
        formatted += "${difference.hour} hora ";
      }
      if (difference.minute > 0) {
        formatted += "e ";
      }
    }
    if (difference.minute > 0) {
      if (difference.minute > 1) {
        formatted += "${difference.minute} minutos ";
      } else {
        formatted += "${difference.minute} minuto ";
      }
    }

    return "${formatted}atrás";
  }
}

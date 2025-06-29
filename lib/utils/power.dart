import '../models/character.dart';

double calculatePower(List<Character> party) {
  double totalDeal = 0;
  double maxBuff = 0;

  for (var c in party) {
    if (c.isDealer) {
      final dmg = c.ozma?.replaceAll(RegExp(r'[^\d]'), '') ?? '0';
      totalDeal += double.parse(dmg);
    } else if (c.isBuffer) {
      final buff = c.buffScore4 ?? c.buffScore ?? '0';
      final buffValue = double.parse(buff.replaceAll(',', ''));
      if (buffValue > maxBuff) {
        maxBuff = buffValue;
      }
    }
  }

  return (totalDeal * maxBuff) / 100000000000000;
}

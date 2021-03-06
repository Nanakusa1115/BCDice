# -*- coding: utf-8 -*-
# frozen_string_literal: true

class RuneQuest < DiceBot
  # ゲームシステムの識別子
  ID = 'RuneQuest'

  # ゲームシステム名
  NAME = 'ルーンクエスト'

  # ゲームシステム名の読みがな
  SORT_KEY = 'るうんくえすと'

  # ダイスボットの使い方
  HELP_MESSAGE = <<INFO_MESSAGE_TEXT
クリティカル、エフェクティブ(効果的成功)、ファンブルの自動判定を行います。
INFO_MESSAGE_TEXT

  # ゲーム別成功度判定(1d100)
  def check_1D100(total_n, _dice_n, signOfInequality, diff, _dice_cnt, _dice_max, _n1, _n_max)
    return "" unless signOfInequality == "<="

    cliticalValue = ((1.0 * diff / 20) + 0.5)

    # 1は常に決定的成功
    return " ＞ 決定的成功" if (total_n <= 1) || (total_n <= cliticalValue)

    # 100は常に致命的失敗
    return " ＞ 致命的失敗" if total_n >= 100

    return " ＞ 効果的成功" if total_n <= (diff / 5 + 0.5)
    return " ＞ 成功" if total_n <= diff
    return " ＞ 致命的失敗" if total_n >= (95 + (diff / 20 + 0.5))

    return " ＞ 失敗"
  end
end

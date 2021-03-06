# -*- coding: utf-8 -*-
# frozen_string_literal: true

class InfiniteFantasia < DiceBot
  # ゲームシステムの識別子
  ID = 'InfiniteFantasia'

  # ゲームシステム名
  NAME = '無限のファンタジア'

  # ゲームシステム名の読みがな
  SORT_KEY = 'むけんのふあんたしあ'

  # ダイスボットの使い方
  HELP_MESSAGE = "失敗、成功レベルの自動判定を行います。\n"

  # ゲーム別成功度判定(1d20)
  def check_1D20(total_n, _dice_n, signOfInequality, diff, _dice_cnt, _dice_max, _n1, _n_max)
    return '' unless signOfInequality == "<="

    return " ＞ 失敗" unless total_n <= diff

    critical = ""

    if total_n <= 1
      critical = "/クリティカル"
    end

    if total_n <= (diff / 32)
      return " ＞ 32レベル成功(32Lv+)#{critical}"
    elsif total_n <= (diff / 16)
      return " ＞ 16レベル成功(16LV+)#{critical}"
    elsif total_n <= (diff / 8)
      return " ＞ 8レベル成功#{critical}"
    elsif total_n <= (diff / 4)
      return " ＞ 4レベル成功#{critical}"
    elsif total_n <= (diff / 2)
      return " ＞ 2レベル成功#{critical}"
    end

    return " ＞ 1レベル成功#{critical}"
  end
end

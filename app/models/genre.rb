class Genre < ActiveHash::Base
  self.data = [
      {id: 1, name: 'おにぎり'}, {id: 2, name: 'お寿司'}, {id: 3, name: 'お弁当'},
      {id: 4, name: 'そば・うどん'}, {id: 5, name: '中華麺・その他麺'}, {id: 6, name: 'スパゲティ・パスタ'},
      {id: 7, name: 'グラタン・ドリア'}, {id: 8, name: 'サンドイッチ・ロールパン'}, {id: 9, name: 'ハンバーガー'},
      {id: 10, name: '惣菜パン・菓子パン'}, {id: 11, name: 'おかず・おつまみ'}, {id: 12, name: 'サラダ'},
      {id: 13, name: 'スナック菓子・チョコ'}, {id: 14, name: 'コンビニスイーツ'}, {id: 15, name: 'アイス・氷菓'},
      {id: 16, name: 'ホットスナック'}, {id: 17, name: '中華まん'}, {id: 18, name: 'おでん'},
      {id: 19, name: '飲み物'}, {id: 20, name: 'お酒'}, {id: 21, name: 'コンビニコーヒー'},
      {id: 22, name: 'カップ麺'}, {id: 23, name: '冷凍食品'}, {id: 24, name: 'その他'},
  ]

end
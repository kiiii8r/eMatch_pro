class Role < ActiveHash::Base
  self.data = [
    { id: 0, name: 'フルスタック' },
    { id: 1, name: 'フロントエンド' },
    { id: 2, name: 'サーバーサイド' }
  ]
end
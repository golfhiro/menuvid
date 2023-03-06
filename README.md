# サービス名：　 Youtube キッチン(仮)

## サービス概要

Youtube の料理動画で献立を作成するサービス

## メインのターゲットユーザー

- Youtube の料理動画を参考にして、料理している人</br>
- Youtube の料理動画で献立を作成したい人</br>

## ユーザーが抱える課題

- 毎日の献立を考えるのがめんどくさくストレスになる</br>
- Youtube の料理動画で献立を考えたい</br>
- 料理動画を再生リストに保存しているけど、いちいちスクロールしなければならず見づらい</br>
- いつ何を食べたのか覚えることができない

## 解決方法

- Youtube の料理動画をもとに近日に食べたものと被らないように配慮し、1 週間の献立を提案しストレスを減らす</br>
- お気に入りの料理動画があれば再生リストを作成し、再生リスト内でも検索しやすいように探しづらいストレスを解消する

## 実装予定の機能

- 利用者</br>

  - 未登録ユーザー</br>

    - ユーザー登録できる</br>
    - トップページが閲覧できる</br>
    - 料理名,材料の一覧を表示し、動画の一覧の表示、再生ができる</br>
    - フリーワードから料理名,材料の検索ができる</br>
    - 1 週だけの献立作成ができる</br>

  - 登録ユーザー</br>
    - ログイン、ログアウトができる</br>
    - 動画の一覧表示には、再生数が多い順から表示できる</br>
    - 気に入った動画は再生リストに保存できる</br>
    - 再生リスト内の検索ができる<br>
    - 作成した献立の履歴が残る<br>
    - 献立が作成できたら、LINE に通知し閲覧できる</br>

- 管理者</br>
  - ユーザーの CRUD</br>

## 今後実装してみたい機能（検討中のもあり）

- 料理人や料理系 Youtuber タグを一覧で載せておき、そのタグから料理動画を一覧で表示、再生する</br>
- 似た献立が食べた日と近いに被らないように献立を作成できる</br>
- 再生リスト内の動画には、レシピや材料がメモできる</br>
- おすすめの料理動画あれば、紹介できる</br>
- ヘビロテしたい料理は料理名と空けたい期間を登録しておき、献立に反映する</br>
- 食べたい気分から動画を検索できる、提案してくれる。「ガッツリ」「あっさり」などから献立を提案</br>
- いつ何を食べたのかカレンダーに登録、表示できる</br>
- おすすめ料理動画を他のユーザーが教えてくれる機能

## なぜこのサービスを作りたいのか？

Youtube の料理動画を参考にすることが多く自分で再生リスト作成しているが、再生リスト内の動画を検索しづらく見づらいと感じていた。また、私のこだわりとしてその日に食べた料理を近日中に食べるのが嫌である。そのためいつ何を食べたのかカレンダーに登録して、それを参考にしながら献立を考えていたがカレンダーに登録するのがめんどくさくなった。そこで、自動で Youtube の料理動画をもとに近日で食べた料理と被らないよう献立を作成してくれるサービスがあれば便利だと感じ作りたいと思った。

## スケジュール

企画〜技術調査及び README〜ER 図作成：2/12 〆切</br>
メイン機能実装：2/12 - 3/17</br>
β 版を RUNTEQ 内リリース(MVP)：3/18 〆切</br>
本番リリース：4/2

## 画面遷移図

[Youtube キッチン]
(https://www.figma.com/file/qCH0aAnM3k2fJmUI60gIZ0/Youtube%E3%80%80%E3%82%AD%E3%83%83%E3%83%81%E3%83%B3%EF%BC%88%E4%BB%AE%EF%BC%89?node-id=0%3A1&t=mjXWwoaCMv0IuIe6-1)

## ER 図

(https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=youtube_kitchen.drawio#R7V1dk9o2FP01PKaDMebjMbDJNtPdSbppm7QvO1qsBTXGorJYIL%2B%2BErZsQIa1FmNjSTObjC0L2dx7dI%2Fv0Qctdzxf3xKwmN1jHwatTttft9ybVqcz6Djsf16wiQu6TicumBLkx0VOVvAV%2FYRJYTspXSIfRnsVKcYBRYv9wgkOQzihe2WAELzar%2FaMg%2F27LsAUSgVfJyCQS78hn86SUqfdzi78CtF0ltx64CUXnsDkx5TgZZjcL8QhjK%2FMgWgmqRrNgI9XO0Xuh5Y7JhjT%2BGi%2BHsOAW1VYLP7cxyNX00cmMKRFPvA4%2Bu%2BfboQ%2FfVs56OfL0lvT28%2Fv3F7czAsIlokt%2FowgiZJHphthIfb0C35IwRMvGkUUEJo40m2zAuYaClAICStwtudBABYR2laPS2Yo8O%2FABi%2BpaEicjZ7RGvoPsR95XebSO9YYP%2BWNP7PGvyYPwy%2BDAE1Ddjxh353fcURgxJ7lDkQ0qSFbJzHYCyQUrneKEmvdQjyHlGxYFYHqxHGb%2FdPVDkBE2WwHGymoQQLKadpy5h12kDhIxVl9yVmn%2FfTA8TaaYYJ%2Bcu8EiTV3fbc9X6F5AEKGcOAfFI3wtktvfYCCYIwDzB28hfmhj3kln%2BDFH4BMIU0KFhiFdGsIb8T%2BmGnG7V%2B8lseedczOneyc%2FfHqhI5xGFHCsMTbgMylK8jdOqJ4kTQawGfRPkkMz4%2BfMKV4fhQApzvA67BIcOAWxIF7MRgMJBh8%2Be0oEJgFKALBAwubIJwGsdu2URRkbsvxba61Uwsfmv6wg2Jmz%2BdgG%2B5myPdhqOCRfmGP7LjAVfRA0lhmFuXWQMBCTwgo6yMs%2FEeSW9PnPMPTQ8nTrH69nhahN647ihZggsLpXfzJ3gEUvMqgsD7eOb1SoVGouQqw0W1bMihEBu1LkkGvbjLoOsVhUE2AgD4S7Z3JBCnELRN0O5KbwWTCbkcfQzDnz9xy32%2B9Tlg0vnaKqAYT5lHC0DJA5QwwrJsBBPh0CPjDwtbXPeB7Mq%2FDOUCBQZG%2BOBiMi%2FTOiU5vQ%2F2lQr3TqTvWOyIsaBDsUwzbaM9sIb%2FfT2HoQ5LGe9Yp4JSfaxvwVQBhXMTvuhJALANUzwBe3QzQ7RbHQdMYIcW4JYSuJ7l5QjYLCv3HBYiiFSa%2BQZlAcVyYxwvyAL7lhep5oejkgMvxgsLcgMbxQnF%2FaM8L8th%2FxG5rEBcUx4JxXODJLw1jjH%2F8hXyI7YwudmUghmsVtfvUweWL95a%2BS5%2FSlXaD5kzp8mT21mlKl2cJPDWFTOBGTelSgIJx%2FN2TRWBLBmfmcupkUPuUrp6C1Nu0VC6FuGWCnqzkUkQDg%2BZyKYDBPC6QcznLBZVzQe2Tu3oK%2BWHjuKC4O7TnAjn%2Fo7Pl%2FCkEKHhcEoNmfSmAwjxOGFgKqJwC6p%2F01Ts%2BrbtxIX9Q2Py6h%2Fy%2BvH7rBcHV43ZRR8ucWV8KkDAu4PflSeB8QGfE%2Fs0B%2BWHHdNiVruhIYuuJomM6nUvF676V8Uof0%2BkXx8W1jOn0ZRlPpzGdFOWWyvuykmfUmI4CFMyjcKvjlZ7EqZNB7WM6fVnH%2B1g3GZSX1vWtkpeaQlbylhEkj9dPCNX43zwCkCd8WAKonABqH8jpy1s56UQAVtcTphCo2tP1fIg1ZwCr4h1HhJwe3sKQQCvfsSuDg102e0V1m%2BGlIvXAZmyly3dpF2iOfDeQMzad5LuBTdlSU8gp2%2FVzdYnynQIUjOPuocL2ikaTgUL2pk4Gtct3w05xGDQtdxsWf2fTnQmG8pCdWbtrKmDBPCqQXxM%2BhVPCOiLk4dbmch2nu5%2FLuUVVt4vlckMrvpaeyw2Lb8p%2BLbncUBZfdcrlhlZ9TfeQE7%2FYY2oyp4AF4xjcadtsrvRsTp0Oas%2FmnLbG6VwGcssGTtv0hE4FDebxgSO%2FLNygaGZH5vjVrrOfzfWK7nF3uZn1jmMJvPR8LusFzUnoHPH7oppmdBnQLYk7jkziRqV0KmAwkMMVNsQ2mhIUcro3UEL9SZ2jMG%2BncUmdU3zMVH8%2BkGfmGJbUKaBBZ0LoPbybPA%2BWq3A073ru6A60b39%2F1%2FFs%2BK8%2B%2FFc5vz7f7bossDoJarPCf74p5GH4KZ9Nrc38%2BnMBoHPEzw9Xou%2FveB76UyjSLxY%2BZ3iKQxB8yEpHhD8PFLE9q3OHt07nHfZfSOkm4QSwpJjzBp0HyVXmMLL5Lro6P%2Fmbn%2FziidOb9e7FG8EZW6Z5T8gWBx8eYqRtCz%2BiIEg%2F4mdV5iDcxGU7NWTgiJ%2BGw0sygSfsJX5VnQpOOlZRLOvjxjwJOQIDQNEL3HuO8t%2FwO%2FJGSFX4eY1o6mZ2vONldpY5mZ9sdj3%2BfRcoDcGG2J75dWwMrgsbriwD3G%2FuYbi0Wj6%2FeqjlF%2F0ds3RK1wU8ZtfZlK%2Flu81baOO4eq%2B0yYBu1Mv7EVsYvtZGBQzmvci7drpu%2BWKOOiUU1fIv%2BG6g9W4JGc7PZoRTLlBnhMPWqujz4p45G%2BaMO6337Wsnh4pwoEgGb8dFoeaq0Pls5K8%2B8qfT56sI%2Fblul%2Bd6NDPwn8K0WWE%2F1xKyWuOjaKa5hm%2BD%2FdFQJfZgaJC0q63sn76WVK%2Ft5vYbeUD%2F2qHRNNU%2FnWG4i41TMexKkCGLSfcsTBFGE5%2Bf%2BUb5LHRb%2BZ9HdBHmheZbWP4vYyp%2Fruus0nOO%2BH%2ByN1yl9J%2F7xNosyz4JcaNk%2F1xL5Kyzuv43%2Fbep%2FmciQWfNPx8adkXXOcJPOURQ5eT9fBR0JBRoJPuYuZgr3xSyvqe%2F8GPXb52wjV2%2BVX%2F8r332fs7aLZ3iv5GLt%2FJNIc%2F1QukmepqzgF20dVxWlIf5K9R4xbHW8r%2FYGOxViVfg9Eo03vQLNgca%2Bsr%2FouK1YEP%2BQfQqF%2F7U4%2Be3jEy9HRtic%2FjXR4ZKXyyUfPQLf9vOSHFw8Hu%2F6bZEoon4KyWfUqEqdkowprvVCVjM7rEPeY3%2FAQ%3D%3D)

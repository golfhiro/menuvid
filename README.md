# サービス名：　 Youtube キッチン(仮)

## サービス概要

Youtube の料理動画で献立を作成するサービス

## メインのターゲットユーザー

- Youtube の料理動画を参考にして、料理している人</br>
- Youtube の料理動画で献立を作成したい人</br>

## ユーザーが抱える課題

- 毎日の献立を考えるのが手間でストレスになる</br>
- Youtube の料理動画で献立を考えたい</br>
- 料理動画を再生リストに保存しているけど、いちいちスクロールしなければならず見づらい</br>
- 近日の献立と被らないよういつ何を食べたのかをメモするのが手間

## 解決方法

- Youtube の料理動画をもとに近日に食べたものと被らないように配慮し、1 週間(もしくは１ヶ月)の献立を提案しストレスを減らす</br>
- お気に入りの料理動画があれば再生リストを作成し、再生リスト内でも検索しやすいように探しづらいストレスを解消する

## 実装予定の機能

- 利用者</br>
  - 未登録ユーザー</br>
    - ユーザー登録できる</br>
    - トップページが閲覧できる</br>
    - １ヶ月の決められた献立が閲覧できる</br>

  - 登録ユーザー</br>
    - ログイン、ログアウトができる</br>
    - 動画をお気に入りリストに保存できる</br>
    - 気に入った動画は再生リストに保存できる</br>
    - 再生リスト内の検索ができる<br>
    - 献立を変更できる<br>
    - 先月ぶんの献立の履歴が閲覧できる<br>
    - 月曜日にその週の献立をLINEに通知する</br>

- 管理者</br>
  - ユーザーのCRUD</br>
  - 料理名のCRUD</br>
  - Youtube動画のCRUD</br>

## 今後実装してみたい機能（検討中のもあり）

- 料理人や料理系Youtuberタグを一覧で載せておき、そのタグから料理動画を一覧で表示、再生できる</br>
- 似た献立が食べた日と近いに被らないように献立を作成できる</br>
- 再生リスト内の動画には、レシピや材料がメモできる</br>
- おすすめの料理動画あれば、紹介できる</br>
- ヘビロテしたい料理は料理名と空けたい期間を登録しておき、献立に反映する</br>
- 食べたい気分から動画を検索できる、提案してくれる。「ガッツリ」「あっさり」などから献立を提案</br>
- いつ何を食べたのかカレンダーに登録、表示できる</br>
- おすすめ料理動画を他のユーザーが教えてくれる機能

## なぜこのサービスを作りたいのか？

仕事をしていると毎日の献立を考えるのが大変である。私のこだわりとしてその日に食べた料理を近日中に食べるのを避けたい。そのためいつ何を食べたのかGoogleカレンダーに登録して、それを参考にしながら献立を考えていたがカレンダーに登録するのも煩わしくなった。そこで、自動でYoutubeの料理動画をもとに近日で食べた料理と被らないよう献立を作成してくれるサービスがあれば便利だと感じ作りたいと思った。また、Youtubeの料理動画を参考にすることが多く、Youtubeアプリで再生リスト作成している。しかし、再生リスト内の動画を検索しづらく見づらいため、検索機能をつけたいと感じた。

## スケジュール

企画〜技術調査及び README〜ER 図作成：2/12 〆切</br>
メイン機能実装：2/12 - 3/17</br>
β 版を RUNTEQ 内リリース(MVP)：3/18 〆切</br>
本番リリース：4/2

## 画面遷移図

[Youtube キッチン](https://www.figma.com/file/qCH0aAnM3k2fJmUI60gIZ0/Youtube%E3%80%80%E3%82%AD%E3%83%83%E3%83%81%E3%83%B3%EF%BC%88%E4%BB%AE%EF%BC%89?node-id=0%3A1&t=mjXWwoaCMv0IuIe6-1)

## ER 図
[ER図](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1#R7V1tk9o2EP41fEwHY5uXj4FLrpneTdJL26T9cqPDOlBjLCqLA%2FLrK4FlAzKcdRgbS5q5ZKwXZLP7aB%2FvaiVa7mi2uiVgPr3HAQxbnXawark3rU5n4Hvsf16x3lZ0vf62YkJQsK1ysoqv6CdMKttJ7QIFMN7rSDEOKZrvV45xFMEx3asDhODlfrdnHO7fdQ4mUKr4OgahXPsNBXSa1DrtdtbwK0STaXLrvp80PIHxjwnBiyi5X4QjuG2ZATFM0jWeggAvd6rcDy13RDCm26vZagRDLlUhse3nPh5pTR%2BZwIgW%2BcDj8L9%2FvBh%2F%2BrZ00M%2BXhb%2Bit5%2Ffud3tMC8gXCSy%2BDOGJE4ema6FhNjTz%2FklBU%2B8ahhTQGiiSLfNKphqKEARJKzC2ZTDEMxjtOm%2BrZmiMLgDa7ygYiBRGj6jFQwetnrkfZlK79hgvMgHf2aDf00ehjeDEE0idj1m353fcUhgzJ7lDsQ06SFLJxHYCyQUrnaqEmndQjyDlKxZl6S1nyhuvV9c7gBE1E13sJGCGiSgnKQjZ9phF4mCVJTVk5R1Wk8PHG%2FDKSboJ9dOmEhzV3eb8hLNQhAxhIPgoGqIN1N6owMUhiMcYq7gDcwPdcw7BQTP%2FwBkAmlSMccoohtB%2BEP2x0Qzav%2Fit3z2rCNWdrIy%2B%2BPdCR3hKKaEYYmPAZlKl5CrdUjxPBk0hM9ifJIInl8%2FYUrx7CgATk%2BA12GR4MAtiAP3YjDoSzD48ttRIDAJUATCB2Y2QTQJt2rbWFGQqS1Ht7nSTiV8KPrDCYqZPJ%2FDjbmboiCAkYJGeoU1sqMCV1EDyWCZWJRHAyEzPRGgbI4w8x9Lak2f8wxNDyRNs%2F71alqY3m3fYTwHYxRN7raf7B5Awa8MCqvjk9MvFRqFhqsAG17bkkEhMmhfkgy6dZOB5xSHQTUGAgZIjHcmE6QQt0zgdSQ1g%2FGY3Y4%2BRmDGn7nlvt9onTBrfO0UUQ0mzKOEgWWAyhlgUDcDCPDpYPAHhaWvu8H3ZV6HM4BCgyx9cTAYZ%2BmdE5PemvpLmXqnU7etd4RZ0MDYpxi21p7JQn6%2Fn8AogCS192xSwAkva2vwVQBhnMX3XAkglgGqZwC%2FbgbwvOI4aBojpBi3hOD5kprHZD2nMHicgzheYhIY5AkUx4V5vCAv4FteqJ4XiiYHXI4XFHIDGscLxfWhPS%2FIa%2F8xu61BXFAcC8ZxgS%2B%2FNIww%2FvEXCiC2GV2spS%2BWa9NUnoJmO9Vw%2BdF7y9%2Bl53Sl86A5OV2%2BTN865XT5lsFTUcgMblROlwIUjCPwrhwFtmRwpjOnTga153R1FWK9TfPlUohbJujKoVyKaGhQMpcCGMzjAtmZs1xQORfUnt3VVfAPG8cFxdWhPRfI%2Fh%2BdLmZPEUDh44IYlPalAArzOKFvKaByCqg%2F66t7PK%2B7cSa%2FX1j8upv8nryB6wXB5eNmV0fLnLQvBUgYZ%2FB7chY4X9EZsn8zQH7YRR3W4omJlNhrr6C5Tu166fa6Z8N4pa%2Fp9Irj4lrWdHpyGE%2BnNZ0U5ZbKe3Ikz6g1HQUomEfhNo5XuhOnTga1r%2Bn05Djex7rJoDy3rmcjeako5EjeIobk8foJoRr9m0cAcsKHJYDKCaD2hZyefJaTTgRg43pCFAJVe3G9AGLNGcBG8Y4jQnYPb2FEoA3fsZb%2BwTGb3aJxm8GlLHXfemylh%2B%2FSKdCc8F1f9th0Ct%2F1rcuWikJ22a6fq0sM3ylAwTjuHiicr2g0GSh4b%2BpkUHv4btApDoOm%2BW6D4u9sujPBQF6yM%2Bt4TQUsmEcF8mvCp2hC2ESE3NxaX67jePu%2BnFs06nYxX25gg6%2Bl%2B3KD4qeyX4svN5CDrzr5cgMbfU0PkRNb%2Bk115hSwYByDO23rzZXuzanTQe3enNPW2J3LQG7ZwGmb7tCpoME8PnDkl4UbFE%2Ftyhxv9Zx9b65b9JC7y2XWO44l8NL9uWwWNMehcxyZwXXy6DKgWxJ3HJnEjXLpVMBgIIcrnIhtNCUo%2BHRvoIT6nTpHIW%2BncU6dU3zNVH8%2BkDNzDHPqFNCgMyF0H96Nn%2FuLZTSceb47vAPt29%2FfdXxr%2Fqs3%2F1Xm1%2BerXZcNVidBbZb5zxeFvAw%2F4dnU2uTXnwsAnS1%2BvrkSc39H8zCYQOF%2BMfM5xRMcgfBDVjsk%2FHmgsO1Znzu8UTqfsP9CStcJJ4AFxZw36CxMWpnCyPq7mOq88Dcv%2FOKL4s1qt%2FFGcMaGad4TssHBh4ct0jaVH1EYph8Jsi4zEK23dTs9ZOCI34bDCzKGJ%2BQlfladCk461lFs6%2BPCPAk5AkNA0Qvce47y3%2FA78kFIVeh5hWiqZna9o2VWypTMC%2BtdjX%2FfBUpDsCGOZ34dG%2F3rwoYrhwHu1%2FcwWthYPm89jOUX%2FSGzNKXrAhqz%2B2zKj%2BW7zdto47h677TJgG7Uy%2FsRWRi%2B10YFDOa9yLs2Xbf8YI46JRSN5V%2Fw3UDr0xIynJ%2FNCKdUoM4Ih6NVMefFPXMOzBl1Wu%2Fb104OFeFAkQzejotCw1UR57OWv3rL7xT9RbwyTH%2Bu2uVcj2Ya%2FlOYNsvs50pCjtYEKJ5qHsO3xv6oqRJnMDQotKtt2D99Lak%2Btps7b%2BQF%2FWuHRtOi%2FmmG4S42TtmwK0GGHEy6Z2aKMJr4%2FMwPymem24b%2FuUUXZl7EfAuH%2F8tI5c9VnY30nBP8PzkbrjL0n%2FvE2mzLPglxo8L%2BuZLI2Wd1%2FW%2F6b4v6n4kEnWP%2B%2BdCwO7rOCfyUQwRVJu%2Fno6AjoUCjsI%2BZm7nyRSHH9%2FQP%2FNj9WydkY7dv1W%2F%2Fa8%2Fez9m7pZP9N3LzVr4o5FwvlB6ipzkL2E1bx8OK8jJ%2FhTFeca11%2BF8cDPZqiFfg9EpivOkXbA409A3%2Fi47Xgg35B9Gr3PhTj57fsjL1dmyIw%2BFfXxkqfbNQ8tEv%2FG07I8X%2Bwe%2F9pscSiSG2Xyn5lApVsSLBmO52J2A%2BvccB5D3%2BBw%3D%3D)

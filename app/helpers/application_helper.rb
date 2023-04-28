module ApplicationHelper
  def page_title(page_title = '', admin = false)
    base_title = if admin
                  'MenuVid(管理画面)'
                 else
                  'MenuVid'
                 end
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'MenuVid',
      title: 'MenuVid',
      reverse: true,
      charset: 'utf-8',
      description: 'MenuVid(メニュービッド)は、Youtube動画であなただけの献立を自動で作成してくれるサービスです。',
      keywords: 'Youtube,献立,料理',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end

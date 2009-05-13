module ArticlesHelper
  def has_photo?(article)
    if article.photo.url != "/photos/original/missing.png"
      return true
    else
      return false
    end
  end
end

class NewsletterJob < Struct.new(:newsletter_id)
  def perform
    newsletter = Newsletter.find(newsletter_id)
    newsletter.deliver
  end
end
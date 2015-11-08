require 'bing_translator'
class Post < ActiveRecord::Base

  def self.create_translated_post(post, locale)
    new_title = do_translate(post.title, post.locale, locale)
    new_body = do_translate(post.body, post.locale, locale)
    Post.create!(title: new_title, body: new_body, locale: locale)
  end

  private


  def self.do_translate(content, from_locale, to_local)
    client.translate(content, from: from_locale, to: to_local)
  end

  def self.client
    @translator ||= BingTranslator.new(
      Rails.configuration.client_id,
      Rails.configuration.client_secret,
      false,
      Rails.configuration.account_key
    )
  end
end

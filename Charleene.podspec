#
# Be sure to run `pod lib lint Charleene.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Charleene"
  s.version          = "0.0.1"
  s.summary          = "Charleene is simple, modern and lightweight solution for porting the UIModalPresentationFormSheet to iPhones."
  s.homepage         = "https://github.com/KitchenStories/Charleene"
  s.license          = 'MIT'
  s.author           = { "Kersten Broich" => "kersten.broich@kitchentories.de" }
  s.source           = { :git => "https://github.com/KitchenStories/Charleene.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kersten_broich'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.resource_bundles = {
    'Charleene' => ['Pod/Assets/**/*']
  }

end

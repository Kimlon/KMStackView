#
# Be sure to run `pod lib lint KMStackView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KMStackView'
  s.version          = '0.1.0'
  s.summary          = '快速搭建简单的界面'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
快速搭建简单的界面,具体见 Demo
                       DESC

  s.homepage         = 'https://github.com/beCooler/KMStackView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'beCooler' => 'lelebabyboy@gmail.com' }
  s.source           = { :git => 'https://github.com/beCooler/KMStackView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'KMStackView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KMStackView' => ['KMStackView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end

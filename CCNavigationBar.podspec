#
# Be sure to run `pod lib lint CCNavigationBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCNavigationBar'
  s.version          = '0.1.3'
  s.summary          = 'A color Changeable NavigationBar'
  s.description      = 'A simple and loose coupling solution for the bizarre effect of system navigationBar when poping by draging gesture from the lefe edge.

Each viewController will has its own navigationBar as its subView and the navigationBar of navigationControllers are set translucent.

By this way, there would be a clear seperation when poping by gesture and without dealing with the mass of back button and titleText as there are still jobs of system. Besides, you can also change its color whenever you want by simply chaning navigationBarColor'


  s.homepage         = 'https://github.com/g-enius/CCNavigationBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'g-enius' => 'chaowangbuaa@gmail.com' }
  s.source           = { :git => 'https://github.com/g-enius/CCNavigationBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CCNavigationBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CCNavigationBar' => ['CCNavigationBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

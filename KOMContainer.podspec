#
#  Be sure to run `pod spec lint KOMContainer.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "KOMContainer"
  s.version      = "0.1.0"
  s.summary      = "A simple Dependency Injection Container."
  s.homepage     = "https://github.com/kohkimakimoto/KOMContainer"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Kohki Makimoto' => 'kohki.makimoto@gmail.com' }
  s.source       = { :git => 'https://github.com/kohkimakimoto/KOMContainer.git', :tag => s.version.to_s }
  s.source_files = 'KOMContainer/Classes/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios

end

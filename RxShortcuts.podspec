Pod::Spec.new do |s|
  s.name             = 'RxShortcuts'
  s.version          = '0.3.0'
  s.summary          = 'RxSwift/RxCocoa shortcuts. subscribeNext, doOnNext and more.'
  s.description      = <<-EOS
  Shortcuts for [RxSwift/RxCocoa](https://github.com/ReactiveX/RxSwift).
  EOS

  s.homepage         = 'https://github.com/sunshinejr/RxShortcuts'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Łukasz Mróz' => 'thesunshinejr@gmail.com' }
  s.source           = { :git => 'https://github.com/sunshinejr/RxShortcuts.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thesunshinejr'

  s.ios.deployment_target = '13.0'
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = "RxShortcuts/RxSwift/*.swift"
    ss.dependency "RxSwift", "~> 5.1.1"
  end

  s.subspec "RxCocoa" do |ss|
    ss.source_files = "RxShortcuts/RxCocoa/*.swift"
    ss.dependency "RxShortcuts/Core"
    ss.dependency "RxCocoa", "~> 5.1.1"
  end
end

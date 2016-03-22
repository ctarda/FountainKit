
Pod::Spec.new do |s|
  s.name             = "FountainKit"
  s.version          = "1.0.1"
  s.summary          = "FountainKit is a lightweight framework to decrease coupling between view controllers and datasources."
  s.description      = <<-DESC
FountainKit is a lightweight framework to decrease coupling between view controllers and datasources.

FountainKit aims to be simple to use, while maintaning a clean API.

FountainKit builds as a framework, and therefore needs iOS 8.
                       DESC
  s.homepage         = "https://github.com/ctarda/FountainKit.git"
  s.license          = { type: "MIT", file: "LICENSE" }
  s.author           = "Cesar Tardaguila"
  s.source           = { git: "https://github.com/ctarda/FountainKit.git", tag: "#{s.version}" }
  s.social_media_url = 'https://twitter.com/ctarda'

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*.{swift,h}'

end

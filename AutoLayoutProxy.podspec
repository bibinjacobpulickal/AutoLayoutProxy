Pod::Spec.new do |spec|

  spec.name         = "AutoLayoutProxy"
  spec.version      = "2.0.3"
  spec.summary      = "AutoLayoutProxy allows you to create and layout views with ease."

  spec.description  =  "AutoLayoutProxy is written in Swift 5. Supports from iOS 9.0. This replaces view declaration code and reduces it. Also, reduces auto layout anchoring code."

  spec.homepage     = "https://github.com/bibinjacobpulickal/AutoLayoutProxy"

  spec.license      = "MIT"

  spec.author             = { "Bibin Jacob Pulickal" => "bibinjacob123@gmail.com" }
  spec.social_media_url   = "https://github.com/bibinjacobpulickal"

  spec.ios.deployment_target 	= '9.0'
  spec.osx.deployment_target 	= '10.11'

  spec.source       = { :git => "https://github.com/bibinjacobpulickal/AutoLayoutProxy.git", :tag => "2.0.3" }

  spec.source_files  = "AutoLayoutProxy/**/*.{h,m,swift}"

  spec.swift_version = ['3.0', '4.0', '4.2', '5.0']

end

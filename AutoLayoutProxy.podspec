Pod::Spec.new do |spec|

  spec.name         = "AutoLayoutProxy"
  spec.version      = "1.6.1"
  spec.summary      = "AutoLayoutProxy allows you to create and layout views with ease."

  spec.description  =  "AutoLayoutProxy is written in Swift 5. Supports from iOS 9.0. This replaces view declaration code and reduces it. Also, reduces auto layout anchoring code."

  spec.homepage     = "https://github.com/bibinjacobpulickal/AutoLayoutProxy"

  spec.license      = "MIT"

  spec.author             = { "Bibin Jacob Pulickal" => "bibinjacob123@gmail.com" }
  spec.social_media_url   = "https://twitter.com/bibinjacob123"

  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/bibinjacobpulickal/AutoLayoutProxy.git", :tag => "1.6.1" }

  spec.source_files  = "AutoLayoutProxy"

  spec.swift_version = "5.0"

end

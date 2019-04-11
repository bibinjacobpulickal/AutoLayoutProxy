# AutoLayoutProxy
AutoLayoutProxy is a convenient way for creating and constraining views. Avoid repetation of code wherever possible.

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
![Swift version](https://img.shields.io/badge/swift-5-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/AutoLayoutProxy.svg?style=flat)](https://github.com/bibinjacobpulickal/AutoLayoutProxy)
[![License](http://img.shields.io/cocoapods/l/AutoLayoutProxy.svg?style=flat)](https://github.com/bibinjacobpulickal/AutoLayoutProxy/blob/master/LICENSE)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AutoLayoutProxy into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AutoLayoutProxy'
end
```

Then, run the following command:

```bash
$ pod install
```

## Features
- [x] Remove repetitive code while creating new view.
- [x] Fill super view or any other view with/without padding.
- [x] Align center with super view or any other view.

## Requirements

- iOS 9.0+
- Xcode 8.3+
- Swift 3.0+

Without AutoLayoutProxy:
-----

```swift
import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(lessThanOrEqualToConstant: view.frame.width - 32).isActive = true
        redView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5, constant: -32).isActive = true
    }
}
```

With AutoLayoutProxy:
-----

```swift
import AutoLayoutProxy

class ViewController: UIViewController {
    
    let redView: UIView = create {
        $0.backgroundColor = .red
    }
    
    let functionalView: UIView = create { view in
        view.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(closureView, layout: {
            $0.top >= view.safeAreaLayoutGuide.topAnchor + 16
            $0.centerX == view.centerXAnchor
            $0.width <= view.frame.width - 32
            $0.height == view.safeAreaLayoutGuide.heightAnchor / 2 - 32
        })
        
        view.addSubview(functionalView,
                        attributes: [.left, .right],
                        bottom: view.safeAreaLayoutGuide.bottomAnchor),
                        padding: UIEdgeInsets(left: 16, bottom: -32, right: -16),
                        height: view.safeAreaLayoutGuide.heightAnchor / 2,
                        size: CGSize(height: -32))
    }
}
```

## License
AutoLayoutProxy is released under the MIT license.  
See LICENSE for details.

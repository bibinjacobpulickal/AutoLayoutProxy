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

view.addSubview(subview)
subview.translatesAutoresizingMaskIntoConstraints = false

subview.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
subview.widthAnchor.constraint(lessThanOrEqualToConstant: view.frame.width - 32).isActive = true
subview.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5, constant: -32).isActive = true
```

With AutoLayoutProxy:
-----

```swift
view.addSubview(subview, layout: { subview in
    subview.top     >= view.safeAreaLayoutGuide.topAnchor + 16
    subview.centerX == view.centerXAnchor
    subview.width   <= view.frame.width - 32
    subview.height  == view.safeAreaLayoutGuide.heightAnchor / 2 - 32
})
// OR
view.addSubview(subview,
                anchors: [.centerX],
                top: view.safeAreaLayoutGuide.topAnchor,
                topRelation: .greaterThanOrEqual,
                widthRelation: .lessThanOrEqual,
                height: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5,
                size: CGSize(w: view.frame.width - 32))
```

## License
AutoLayoutProxy is released under the MIT license.  
See LICENSE for details.

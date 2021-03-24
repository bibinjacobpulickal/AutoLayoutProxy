# AutoLayoutProxy

A simple and lightweight Auto-Layout Kit that makes you feels laying out views as a fun game. AutoLayoutProxy supports UIKit on iOS & tvOS and AppKit on MacOS so you wouldn't have to worry about using different solutions on different platforms. AutoLayoutProxy is compiled on Xcode 12.0 using Swift 5.3 and will be updated for all future releases.

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
![Swift version](https://img.shields.io/badge/swift-5.3-orange.svg)
[![License](http://img.shields.io/badge/license-MIT-lightgray.svg?style=flat)](https://github.com/bibinjacobpulickal/AutoLayoutProxy/blob/master/LICENSE)

## Why use AutoLayoutProxy?

Have you ever had to write lines and lines of code to add subviews and anchor them like the following:
```swift
view.addSubview(subview)
subview.translatesAutoresizingMaskIntoConstraints = false

subview.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
...
subview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
```

Worry no more AutoLayoutProxy helps you with this situation as follows:
```swift
view.addSubview(subview) {
    subview.top      == view.bottom
    ...
    subview.trailing == view.trailing
}
// Or in short 🙂
view.addSubview(subview) { $0.sides == $1.sides }

// Or even shorter 😎
view.addSubview(subview) { $0 === $1 } 
```

You see thats all thats required. Now, you might be wondering what would you do if you had to make a constraint with a relation that's not equal but, less than or greater than, like the following:
```swift
subview.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: -8).isActive = true
subview.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor: constant: 16).isActive = true
```

AutoLayoutProxy let's you do this:
```swift
subview.leading  <= view.leading
subview.trailing >= view.trailing
```

In the case of constants you can add or substract them in the same expresion, so instead of this:
```swift
subview.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 16).isActive = true
subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -32).isActive = true
```

You only need this:
subview.top     == view.bottom + 16
subview.leading == view.trailing - 32
If you would like to get the constraint for animations or reference in future, just do:
```swift
let subviewTopConstraint      = subview.top == view.bottom + 16
subviewTopConstraint.constant = 32
```

If you don't want the constraints to not be active on the first go just do, '!=' or even '!<=' and '!>=', like the following:
```swift
subview.top      != view.bottom
subview.leading  !<= view.leading
subview.trailing !>= view.trailing
```

In case of dimensions like height or width:
```swift
subview.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2, constant: 8).isActive = true
subview.heightAnchor.constraint(equalToConstant: 64).isActive = true
```
You only need this:
```swift
subview.width  == view.width * 2 + 8
subview.height == 64
```
For addSubview and translatesAutoresizingMaskIntoConstraints = false you could just write a closure as follows:
```swift
view.addSubview(subview) {
  subview.sides <= view.sides
}
```
You also have other helpers like sides that include all sides, and size which takes a CGSize and also both horizontal and vertical constraints and centers.
```swift
// Constraint all sides with a padding of 2
subview.sides == view.sides + 2

// Constraint all sides with different padding on each side.
subview.sides == view.sides + UIEdgeInsets(t: 1, l: 2, b: 4, r: 8)

// Align both centers of view and subview
subview.centers == view.centers

// Constraint both centers with offsets 4 and 8.
subview.centers == view.centers + UIOffset(x: 4, y: 8)

// Constraint vertical(top and bottom) or horizontal(leading and trailing)
subview.vertical   == view.vertical
subview.horizontal == view.horizontal

// Constraint size either with CGSize or both sides 64
subview.size == CGSize(w: 8, h: 16)
subview.size == 64
```

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but BBLoader does support its use on supported platforms.

Once you have your Swift package set up, adding BBLoader as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/bibinjacobpulickal/AutoLayoutProxy.git", .upToNextMajor(from: "3.0.0"))
]
```
From Xcode 11.0+ you only need to provide the above mentioned URL.

## Features
- [x] Remove repetitive code while creating new view.
- [x] Fill super view or any other view with/without padding.
- [x] Align center with super view or any other view.

## Support

- iOS 9.0+
- Xcode 8.3+
- Swift 3.0+

## License
AutoLayoutProxy is released under the MIT license.  
See [LICENSE](https://github.com/bibinjacobpulickal/AutoLayoutProxy/blob/master/LICENSE) for details.

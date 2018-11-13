# AutoLayoutProxy
AutoLayoutProxy is a convenient way for creating and constraining views. Avoid repetation of code wherever possible.


## Installation

Manual installation
-----

Download and drop the 'AutoLayoutProxy' folder into your Xcode project.  

Using [CocoaPods](http://cocoapods.org/)
-----

```
pod 'AutoLayoutProxy'
```

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(closureView, layout: {
            $0.top >= view.safeAreaLayoutGuide.topAnchor + 16
            $0.centerX == view.centerXAnchor
            $0.width <= view.frame.width - 32
            $0.height == view.safeAreaLayoutGuide.heightAnchor / 2 - 32
        })
    }
}
```

## License
AutoLayoutProxy is released under the MIT license.  
See LICENSE for details.

# Tokui
[![Swift Version][swift-image]][swift-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License][license-image]][license-url]

Tokui is a library with a ready to use tutorial screen that lights items, written in Swift.
<img src="image.gif" width=20%>

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `Tokui` by adding it to your `Podfile`:

```ruby
pod 'Tokui'
```

To get the full benefits,  import `Tokui` 

``` swift
import Tokui
```
#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/Tokui.framework` to an iOS project.

```
github "YuigaWada/Tokui"
```
#### Manually
1. Download and drop ```Tokui``` in your project.  
2. Congratulations!  

## Usage example

```swift
import Tokui

let tki = TokuiViewController()

//Lighting target Items
tki.add(target: button , message:"You tapped here." , location: .above)
tki.add(target: label , message:"Tokui is a comedian of the Japanese comedy duo Tutorial.")

tki.PreparePages()

tki.modalTransitionStyle = .crossDissolve
self.present(tki, animated: true, completion: nil)
```

## Contribute

We would love you for the contribution to **Tokui**, check the ``LICENSE`` file for more info.

## Meta

Yuiga Wada– [@YuigaWada](https://twitter.com/YuigaWada)  :  [WebSite](https://yuigawada.github.io/) 

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/YuigaWada/Tokui](https://github.com/YuigaWada/Tokui)




[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com

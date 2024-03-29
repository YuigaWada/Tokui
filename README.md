# Tokui
[![Swift Version][swift-image]][swift-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)
[![License][license-image]][license-url]
<!-- [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
-->


Tokui is a library with a ready to use tutorial screen that lights items, written in Swift.<br>
(Swift始めて2週間ちょいの初学者がお勉強目的で作ったので、今見返すとあんまよくないですこれ。)


## Preview
<img src="image.gif" width=30%>

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
<!--
#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/Tokui.framework` to an iOS project.

```
github "YuigaWada/Tokui"
```-->
#### Manually
1. Download and drop ```Tokui``` in your project.  
2. Congratulations!  

## Usage example

```swift
import Tokui

let tokui = TokuiViewController()

//Lighting target Items
tokui.add(target: button , message:"You tapped here." , position: .above)
tokui.add(target: label , message:"Tokui is a comedian of the Japanese comedy duo Tutorial.")

tokui.PreparePages()

tokui.modalTransitionStyle = .crossDissolve
self.present(tokui, animated: true, completion: nil)
```

**You must use "PreparePages()" before "self.present"**

## Usage
Tokui is very simple.

### Lighting items

A spotlite and message Label is positioned automatically.

"message" can include "\n" (line feed).

```swift
tokui.add(target: button , message:"You tapped here." , location: .above)
tokui.add(target: label , message:"Tokui is a comedian of the \n Japanese comedy duo Tutorial.")
```
### PreparePages

```swift
tokui.PreparePages()
```
<u>You must use "PreparePages()" before "self.present"</u>

### Raw call to TokuiViewController

```swift
let tokui = TokuiViewController(magnification: 1.2,
                                alpha: 0.5,
                                font: .systemFont(ofSize: 18.0),
                                displayDots: true,
                                pageControlPosition:nil)
```

### Position

Enumeration 'MessagePosition' is defined as follow.
(Default is auto.)

```swift
public enum MessagePosition
{
case above
case below
case right
case left
case auto
}
```


## Contribute

We would love you for the contribution to **Tokui**, check the ``LICENSE`` file for more info.



## Others

Yuiga Wada -  [WebSite](https://yuigawada.github.io/) 
Twitter         - [@YuigaWada](https://twitter.com/YuigaWada) 





Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/YuigaWada/Tokui](https://github.com/YuigaWada/Tokui)




[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com

# CCNavigationBar

[![CI Status](http://img.shields.io/travis/g-enius/CCNavigationBar.svg?style=flat)](https://travis-ci.org/g-enius/CCNavigationBar)
[![Version](https://img.shields.io/cocoapods/v/CCNavigationBar.svg?style=flat)](http://cocoapods.org/pods/CCNavigationBar)
[![License](https://img.shields.io/cocoapods/l/CCNavigationBar.svg?style=flat)](http://cocoapods.org/pods/CCNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/CCNavigationBar.svg?style=flat)](http://cocoapods.org/pods/CCNavigationBar)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CCNavigationBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CCNavigationBar"
```
A simple and loose coupling solution for the bizarre effect of system navigationBar when poping by draging gesture from the lefe edge.

Each viewController will has its own navigationBar as its subView and the navigationBar of navigationControllers are set translucent.

By this way, there would be a clear seperation when poping by gesture and without dealing with the mass of back button and titleText as there are still jobs of system. Besides, you can also change its color whenever you want by simply chaning navigationBarColor

![alt tag](https://github.com/g-enius/CCNavigationBar/blob/master/iPhoneX.gif)
![alt tag](https://github.com/g-enius/CCNavigationBar/blob/master/iPhone8+.gif)

## Author

g-enius, chaowangbuaa@gmail.com

## License

CCNavigationBar is available under the MIT license. See the LICENSE file for more info.

# SimplePagesiOS

![An example of a Vertifal Page Controller within a Horizontal Page Controller][example]
![An example of the configuration for a Page][page-config]
![An example of the configuration for a Page Controller][page-controller-config]

[example]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/example.gif "Example"
[page-config]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/pageConfigurationExample.png "Page Config Example"
[page-controller-config]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/pageControllerConfigurationExample.png "Page Controller Config Example"

[![CI Status](https://img.shields.io/travis/nathan-fiscaletti/SimplePagesiOS.svg?style=flat)](https://travis-ci.org/nathan-fiscaletti/SimplePagesiOS)
[![Version](https://img.shields.io/cocoapods/v/SimplePagesiOS.svg?style=flat)](https://cocoapods.org/pods/SimplePagesiOS)
[![License](https://img.shields.io/cocoapods/l/SimplePagesiOS.svg?style=flat)](https://cocoapods.org/pods/SimplePagesiOS)
[![Platform](https://img.shields.io/cocoapods/p/SimplePagesiOS.svg?style=flat)](https://cocoapods.org/pods/SimplePagesiOS)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SimplePagesiOS is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimplePagesiOS'
```

## Usage

### Create a **Page Veiw Controller** to use for your View Controller and configure it in your StoryBoard.


|Property|Description|
|---|---|
||![An example of the configuration for a Page Controller][page-controller-config]|
|`InferIds`|When enabled, this will automatically determine the ID's for your pages.|
|`Initial Page ID`|The ID of the Page that the Page Controller should start on.|
|`Preferred ID`|The ID that you would prefer this Page to have. If `InferIds` is enabled, this will be ignored.|
|`Page Name`|The name for the Page.|

> Notes: All PageControllers can also be used as Pages on other Page Controllers, that's why we have the `Preferred ID` and `Page Name` in the Page Controlle configuration. 

### Create as many pages as you'd like for your PageController and configure them in your StoryBoard.

|Property|Description|
|---|---|
||![An example of the configuration for a Page][page-config]|
|`Preferred ID`|The ID that you would prefer this Page to have. If `InferIds` is enabled, this will be ignored.|
|`Page Name`|The name for the Page.|

### Create a new class and import `SimplePagesiOS`

## Author

nathan-fiscaletti, nathan.fiscaletti@gmail.com

## License

SimplePagesiOS is available under the MIT license. See the LICENSE file for more info.

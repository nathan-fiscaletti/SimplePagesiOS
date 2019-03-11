# SimplePagesiOS

![An example of a Vertifal Page Controller within a Horizontal Page Controller][example]
![An example of the configuration for a Page][page-config]
![An example of the configuration for a Page Controller][page-controller-config]

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

1. Create a new class and import `SimplePagesiOS`|
2. Extend the **PageController** class from the SimplePagesiOS framework.|
3. Override the `loadPages` function of the class and add your Pages.
```swift
import SimplePagesiOS

class HPageController : PageController
{
    override func loadPages() {
        // You can add PageControllers as Pages to another PageController
        self.add(page: self.storyboard?.instantiateViewController(withIdentifier: "Page1") as! PageController)

        // Add regular Pages
        self.add(page: self.storyboard?.instantiateViewController(withIdentifier: "Page2") as! Page)
        self.add(page: self.storyboard?.instantiateViewController(withIdentifier: "Page3") as! Page)
    }
}
```
4. Open your storyboard and add a **Page Veiw Controller** to use for your View Controller.
5. Set it's Class to the class you created earlier.
![Set the custom class][page-controller-class]
6. Configure the Page Controller section
|Property|Description|
|---|---|
||![An example of the configuration for a Page Controller][page-controller-config]|
|`InferIds`|When enabled, this will automatically determine the ID's for your pages.|
|`Initial Page ID`|The ID of the Page that the Page Controller should start on.|
|`Preferred ID`|The ID that you would prefer this Page to have. If `InferIds` is enabled, this will be ignored.|
|`Page Name`|The name for the Page.|
7. Configure the Page View Controller part of the Story Board configuration.
> Notes: All PageControllers can also be used as Pages on other Page Controllers, that's why we have the `Preferred ID` and `Page Name` in the Page Controlle configuration. 
8. Create as many **View Controllers** and set their custom class to **Page**.
![Set the custom class][page-class]
9. Configure their Page configuration section
|Property|Description|
|---|---|
||![An example of the configuration for a Page][page-config]|
|`Preferred ID`|The ID that you would prefer this Page to have. If `InferIds` is enabled, this will be ignored.|
|`Page Name`|The name for the Page.|

10. **Run your application.**

## Author

nathan-fiscaletti, nathan.fiscaletti@gmail.com

## License

SimplePagesiOS is available under the MIT license. See the LICENSE file for more info.

[example]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/example.gif "Example"
[page-config]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/pageConfigurationExample.png "Page Config Example"
[page-controller-config]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/pageControllerConfigurationExample.png "Page Controller Config Example"
[page-controller-class]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/customClassPageController.png "Page Controller Custom Class"
[page-class]: https://github.com/nathan-fiscaletti/SimplePagesiOS/raw/master/Images/customClassPage.png "Page Custom Class"

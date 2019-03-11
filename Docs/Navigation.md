# SimplePagesiOS -- Navigation

You can navigate between pages on your **PageController** using several functions.

> Note: You can access the PageController for a page by calling `pageController()` from the page.

### Navigating foward and backward

```swift
// Navigate Back
self.pageController().navigateBack(animated: true)

// Navigate Forward
self.pageController().navigateForward(animated: true)
```

### Navigating to a specific page

1. By ID

```swift
self.pageController().navigateTo(
    pageWithId: 3,
    animated: true,
    direction: .forward
)
```

2. By Name

```swift
self.pageController().navigateTo(
    pageWithName: "Awards",
    animated: true,
    direction: .forward
)
```

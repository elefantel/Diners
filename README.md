# Diners
Showing local businesses in your area. Currently limited to the San Jose, CA

## Requirements
iOS 16.0+ Beta,
iPadOS 16.0+ Beta,
Xcode 14.0 Beta

While you can build and run the project to device or simulator from macOS 12.4 (Monterey), you require macOS 13.0+ Beta (Ventura) to build and run to a macOS target.

## Working with the codebase
This project contains two branches:

1. [split-view-navigation (main)](https://github.com/elefantel/Diners/tree/navigation-stack)

This shows the [NavigationSplitView](https://developer.apple.com/documentation/SwiftUI/NavigationSplitView) - a view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns

![NavigationSplitView](https://user-images.githubusercontent.com/17785504/177979336-6177183d-c3a2-4ba9-a9ae-547cb23e552e.png)


2. [navigation-stack](https://github.com/elefantel/Diners/tree/navigation-stack)

This shows the [NavigationStack](https://developer.apple.com/documentation/SwiftUI/NavigationStack) - A view that displays a root view and enables you to present additional views over the root view.

![NavigationStack](https://user-images.githubusercontent.com/17785504/177979351-541329de-c0c7-4c61-9e3f-0fc6b9b52ebb.png)


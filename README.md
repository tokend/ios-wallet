# TokenDWallet

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TokenDWallet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TokenDWallet'
```

## XDR Update
XDR's are added as a git submodule so to get them after clone run the following command:
```
git submodule update --init
```
XDR generation requires Ruby. For initial dependencies installation run the following command:
```
bundle install
```
To update XDR classes run the following command:
```
rake xdr:generate
```

## Author

Distributed Lab

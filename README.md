# KOMContainer

A simple Dependency Injection Container.

## Warnings

**This software is under the development stage. The functionality is not enough.**

## Requirements

* iOS 7.0 or later
* Xcode5 or later
* ARC

## Installation

You can install it via [CocoaPods](http://cocoapods.org). Add the following line to your Podfile.

```
pod 'KOMContainer', :git => 'https://github.com/kohkimakimoto/KOMContainer.git'
```

## Usage

### Getting a shared container instance.

```Objective-C
KOMContainer *container = [KOMContainer sharedContainer];
```

### Binding a key with a resolver.

You can bind a key with a resolver to create a object. The object is shared object. The container retuns same instance each time.

```Objective-C
[container bindKey:@"myclass" resolver:^id(KOMContainer *container){
    return [[MyClass alloc] init];
}];
```

You can get a object the following code.

```Objective-C
MyClass *myclass = (MyClass *)[container objectForKey:@"myclass"];
```

### Binding a key with a resolver (no shared object).

If you want to get a diffent instance, you can bind the following method.

```Objective-C
[container bindKey:@"test.arr" shared:NO resolver:^id(KOMContainer *container){
    return [[MyClass alloc] init];
}];
```


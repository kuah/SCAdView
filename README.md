

# SCAdView
[![Version](https://img.shields.io/cocoapods/v/FSCalendar.svg?style=flat)](http://cocoadocs.org/docsets/SCAdView)
[![Platform](https://img.shields.io/badge/platform-iOS%207%2B-blue.svg?style=flat)](http://cocoadocs.org/docsets/SCAdView)

`无限轮播图`

`3D轮播图`

`广告轮播图`

## Statement
If my code can help you even a little bit  ,  please click `star` . Thanks for your support , your star is my motivation.
   
## Introduction
[SCAdView](https://github.com/Chan4iOS/SCAdView) is a carousel control which support the vertical or horizontal scrolling direction, finite / infinite loop carousel , with both 2D plane effect or 3D zoom effect.

## Installation
##### Manual installation
[download](https://github.com/Chan4iOS/SCAdView) the code and unzip,then copy `SCAdView` directory into your project.
##### CocoaPods
create or modify your podfile:
```
pod 'SCAdView'
```
and then `pod install`

## Usage
The [SCAdView](https://github.com/Chan4iOS/SCAdView) should be created by a `SCAdViewBuilder`,we can customize  [SCAdView](https://github.com/Chan4iOS/SCAdView)  by modifying a builder's property.
**eg.**
```
    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        builder.adArray = arrayFromService;
        builder.viewFrame = (CGRect){0,100,self.view.bounds.size.width,self.view.bounds.size.width/2.f};
        builder.adItemSize = (CGSize){self.view.bounds.size.width/2.5f,self.view.bounds.size.width/4.f};
        builder.minimumLineSpacing = 0;
        builder.secondaryItemMinAlpha = 0.6;
        builder.threeDimensionalScale = 1.45;
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
    }];
```
## About SCAdViewBuilder
Please read SCAdViewBuilder's  interface in `SCAdView.h` file.

## Effects

![Horizontal scrolling](http://upload-images.jianshu.io/upload_images/2170902-d1adf340ae56286b.gif?imageMogr2/auto-orient/strip)


![Vertical scrolling](http://upload-images.jianshu.io/upload_images/2170902-8971e30031675097.gif?imageMogr2/auto-orient/strip)

# SCAdView
## 前言
如果我的代码能帮助到你哪怕是一点点，请点一下star。谢谢你的支持，你的star是我的动力。
## 介绍
[SCAdView](https://github.com/Chan4iOS/SCAdView) 是一个支持2D平面效果和3D缩放效果 , 可定制上下左右方向滚动 , 有限/无限循环 轮播的轮播控件
## 安装
##### 手动安装
[下载](https://github.com/Chan4iOS/SCAdView)源代码并解压，将目录下`SCAdView`文件夹添加到你的项目中
##### CocoaPods
创建或在你的 podfile中添加:
```
pod 'SCAdView'
```
然后到终端cd到目录下执行 `pod install`

## 用法
在使用的时候，我们应该通过一个`SCAdViewBuilder`对象来构造出[SCAdView](https://github.com/Chan4iOS/SCAdView)，而我们可以通过在构造方法中修改buidler中的属性，来定制一个我们想要的 [SCAdView](https://github.com/Chan4iOS/SCAdView)
**eg.**
```
    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        builder.adArray = arrayFromService;
        builder.viewFrame = (CGRect){0,100,self.view.bounds.size.width,self.view.bounds.size.width/2.f};
        builder.adItemSize = (CGSize){self.view.bounds.size.width/2.5f,self.view.bounds.size.width/4.f};
        builder.minimumLineSpacing = 0;
        builder.secondaryItemMinAlpha = 0.6;
        builder.threeDimensionalScale = 1.45;
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
    }];
```
#### SCAdViewBuilder 的详解
请到`SCAdView.h`文件查阅SCAdViewBuilder的 interface。

## 效果
![水平滚动效果](http://upload-images.jianshu.io/upload_images/2170902-d1adf340ae56286b.gif?imageMogr2/auto-orient/strip)

![垂直滚动效果](http://upload-images.jianshu.io/upload_images/2170902-8971e30031675097.gif?imageMogr2/auto-orient/strip)

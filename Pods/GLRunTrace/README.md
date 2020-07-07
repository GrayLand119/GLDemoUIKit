# RunTrace
一个可以实时跟踪分析iOS App视图的小工具.

## 修改

1. 去掉升级检测.
2. 消除 string format 时的警告.
3. 默认 DBUG 模式下的模拟器开启, 避免发版忘记关闭开关.

## 安装

```
pod 'RunTrace', :git => "https://github.com/GrayLand119/RunTrace.git"
```

## 禁用/启用

修改为只有在 DEBUG 且是模拟器模式下才启用, 发布自动禁用

```
// RunTrace.h

#if DEBUG
    #if TARGET_IPHONE_SIMULATOR
        #define RunTraceOpen 1 // 启用
    #else
        #define RunTraceOpen 0 // 禁用
    #endif
#endif
```

## 使用
### 获取view的基本信息
将圆形按钮拖到你想获取信息的view上即可,它可以获取你想要的任何view，无论是tabitem上的，还是navigationitem上，甚至uiwindow上的，你都可以获取到。点击顶部的信息栏，便会弹出一个窗口，在General列表里会列出view的基本信息。

![](https://github.com/grayland119/RunTrace/raw/master/Resource/1.gif)

### 获取view的父视图和子视图

想看看这个view的父视图或者子视图有哪些，将圆形按钮拖到你想获取信息的view上，点击顶部的信息栏，便会弹出一个窗口，在SuperViews和SubViews列表里列举出了这个view的父视图（按照以此往上的顺序）和子视图（按照由内向外的顺序），点击便会列举出该视图的信息，右上角有一个back按钮，点击便可以一层层的回到原先的视图。当你不知道当前获取的是哪一个view的信息时，hit按钮可以快速的帮你定位到当前正在查看的是哪一个view。

![](https://github.com/grayland119/RunTrace/raw/master/Resource/2.gif)

### 显示自动布局信息

获取你想要的view，在弹出窗口里，在Constrains列表显示view的自动布局约束，点击列表，相应的约束在页面上高亮显示。

![](https://github.com/grayland119/RunTrace/raw/master/Resource/3.gif)

### 追踪view的状态

很多时候，我们实时跟踪一个view的状态和属性，比如它的frame的变化，它的center的变化，它的superview的改变，它的subview的改变，它的contentSize的改变等等变化，现在一个按钮即可实现你想要的。点击弹出窗口上的Trace列表里的Start按钮，即可追踪该view的状态，view的更新信息全部都在列表里，当你点击stop的时候，便会停止追踪。

![](https://github.com/grayland119/RunTrace/raw/master/Resource/4.gif)

### 监测内存泄露

没有听错吧，它可以监测内存泄露，是的，那么如何来做呢，你push进一个viewController的时候，随便获取一个view的信息，然后pop回来，如果内存正常会弹出RemoveFromSuperview的提示框，如果没有弹出，说明那个viewController发生了内存泄露。

![](https://github.com/grayland119/RunTrace/raw/master/Resource/5.gif)

## 简介

相信点击空白处收起键盘、输入框左边有标题之类的这些具体的小点，大家遇到的很多，也用得很多。为了免去重复工作，抽象出来一些基类，所有的工作都是仅仅对 iOS 基础控件进行进一步扩展、抽象和封装。旨在方便在 Storyboard 中更方便的进行 可视化编辑。

诸如点击空白处键盘收起，现在只需在storyboard 里面给 ViewController 编辑一个属性 editable 为 true ，就可达成了。

### 集成使用的时候可以有两种姿势：

1. 使用CocoaPods的同学可以：pod 'VisualEditWidgets', '~> 0.3.3' 
2. 喜欢自己管理源码的同学可以直接下载源代码，讲 VEWidgets 目录加入项目就行。


### VETextField

*	继承自：UITextField
*	扩展功能
		1、title：通过storyboard中keypath的编辑，快捷添加输入框标题
		2、icon：通过storyboard中keypath的编辑，快捷添加输入框图标

### VEViewController

*	继承自：UIViewController
*	扩展功能
		1、键盘防遮盖：通过storyboard中keypath的编辑，标记当前场景为editable为true，当键盘弹出时会根据当前活动控件的位置滚动视图

### VENavigationController

*	继承自：UINavigationController
*	扩展功能
		1、添加标记：每一次push时允许打标记，弹出时可以弹出到上一次标记，方便处理某些子流程

### VETableView

*	继承自：UITableView
*	扩展功能
		1、表头高度：通过storyboard中keypath的编辑，快捷编辑表头高度，默认为0；

### VETabBar
*	继承自：UITabBar
*	扩展功能
		1、隐藏舒缓动画：给 setHidden 添加动画

### UIColor+VE

*	扩展自：UIColor
*	扩展功能
		1、16进制颜色：实现16进制颜色值实例化 UIColor 对象

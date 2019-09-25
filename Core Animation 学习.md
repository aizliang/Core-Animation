## Core Animation 学习

### 隐式动画

图层改变属性的时候，不是马上在屏幕上生效，而是会有一个过渡动画。这个过渡动画就称为隐式动画。

例如直接修改一个 layer 的背景色，效果如下：

![](https://github.com/windazl/CoreAnimation/blob/master/Resource/changLayerColor.gif)


`CALayerDelegate` 有一个代理方法

```Swift
func action(for layer: CALayer, forKey event: String) -> CAAction?
```

`CALayer` 会通过这个代理方法获取到属性变化的 `CAAction`，返回形式有三种：

1. 当返回一个动作对象时，这种情况下 layer 将使用这个动作。
2. 当返回一个 nil 时，layer 就会到其他地方继续寻找动作。
3. 当返回一个 `NSNull` 对象，告诉 layer 这里不需要执行一个动作，搜索也会就此停止。

`UIView` 是对应 `CALayer` 的代理，遵循了 `CALayerDelegate`。一般情况下属性改变时，会返回
`NSNull`，当属性改变发生在动画 block 中时，会返回一个实际动作。

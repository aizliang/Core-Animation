//
//  AnimationProperty.m
//  显示动画
//
//  Created by ai on 17/5/31.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "AnimationProperty.h"

@interface AnimationProperty ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (nonatomic, strong) CALayer *colorLayer;

@property (weak, nonatomic) IBOutlet UIView *planeView;
@property (nonatomic, strong) CALayer *planeLayer;
@end

@implementation AnimationProperty

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.colorView.bounds;
    self.colorLayer.backgroundColor = [UIColor grayColor].CGColor;
    [self.colorView.layer addSublayer:self.colorLayer];
    
    self.planeLayer = [CALayer layer];
    self.planeLayer.frame = self.planeView.bounds;
    self.planeLayer.contents = (__bridge id)[UIImage imageNamed:@"飞机"].CGImage;
    [self.planeView.layer addSublayer:self.planeLayer];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view.
}

- (IBAction)changeColor:(id)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    [self.colorLayer addAnimation:animation forKey:@"backgroundColor"];
}

- (IBAction)changePlaneRotation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    //transform.rotation 是虚拟属性，实际上并不存在，Core Animation自动地根据CAValueFunction计算的值来更新transform属性
    animation.keyPath = @"transform.rotation";
    animation.byValue = @(M_PI * 2);
    animation.duration = 2.0;
    [self.planeLayer addAnimation:animation forKey:nil];
}

- (IBAction)planeFly:(id)sender {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.planeLayer.position];
    [path addCurveToPoint:CGPointMake(300, 16) controlPoint1:CGPointMake(127, -100) controlPoint2:CGPointMake(243, 116)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    [self.planeView.layer addSublayer:shapeLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.duration = 8.0;
//    animation.timeOffset = 1.0;
//    animation.beginTime = CACurrentMediaTime() + 2.0;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self.planeLayer addAnimation:animation forKey:@"planeFly"];
    
    //动画结束之后回回到最开始的状态，所以这里通过planeLayer的属性为动画最后的状态(即:飞机的位置是动画最后停留的位置)来保留最后的状态，并且通过新建事务关闭隐式动画。 （推荐）
    //另外一种停留在最后状态的通用做法是 动画的 fillMode 属性为 kCAFillModeForward 以留在最终状态，并设置removedOnCompletion 为 NO 以防止它被自动移除，不过如果将已完成的动画保持在 layer 上时，会造成额外的开销，因为渲染器会去进行额外的绘画工作。（不推荐）
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.planeLayer.position = CGPointMake(300, 16);
    [CATransaction commit];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}


//调整CALayer和CAGroupAnimation的speed timeOffset beginTime 会影响子动画
//动画开始之后就不能修改动画的属性值了，但可以根据上面的特性影响动画
- (IBAction)suspendFly:(id)sender {
    self.planeLayer.speed = 0;
}


- (void)pan:(UIPanGestureRecognizer *)panGesture {
    float x = [panGesture translationInView:self.planeView].x;
    x /= 20;
    float currentTimeOffset = self.planeLayer.timeOffset;
    float timeOffset = MIN(7.99, MAX(0.01, currentTimeOffset + x));
    self.planeLayer.timeOffset = timeOffset;
    
    [panGesture setTranslation:CGPointZero inView:self.planeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

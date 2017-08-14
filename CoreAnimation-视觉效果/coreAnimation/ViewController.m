//
//  ViewController.m
//  coreAnimation
//
//  Created by ai on 17/4/1.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ViewController.h"
#import "MaskVC.h"

@interface ViewController ()<CALayerDelegate>
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CALayer *shadowLayer;
@property (nonatomic, strong) CALayer *subLayer;

@property (nonatomic, assign) BOOL defaultScale;
@property (nonatomic, assign) BOOL defaultRect;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMyLayer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addMyLayer {
    self.layer = [[CALayer alloc] init];
    _layer.frame = CGRectMake(100, 100, 200, 200);
    _layer.backgroundColor = [UIColor blueColor].CGColor;
    _layer.delegate = self;
    [self.view.layer addSublayer:_layer];
    
    UIImage *image = [UIImage imageNamed:@"bg.jpg"];
    _layer.contents = (__bridge id)image.CGImage;
    _layer.contentsGravity = kCAGravityResizeAspectFill;
    _layer.contentsScale = image.scale;
    //剪切
    _layer.masksToBounds = YES;
    
    
    self.subLayer = [[CALayer alloc] init];
    _subLayer.frame = CGRectMake(-20, -20, 50, 50);
    _subLayer.backgroundColor = [UIColor grayColor].CGColor;
    [_layer addSublayer:_subLayer];
    
    
    /**
        通过两个layer实现剪切和阴影同时存在
    */
    self.shadowLayer = [[CALayer alloc] init];
    _shadowLayer.frame = CGRectMake(100, 100, 200, 200);
    _shadowLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer insertSublayer:_shadowLayer below:_layer];
    
    _shadowLayer.contents = (__bridge id)image.CGImage;
    _shadowLayer.contentsGravity = kCAGravityResizeAspectFill;
    _shadowLayer.contentsScale = image.scale;
    
    //阴影
    _shadowLayer.shadowOpacity = 0.2;
    _shadowLayer.shadowColor = [UIColor redColor].CGColor;
    _shadowLayer.shadowOffset = CGSizeMake(0, 10);
    _shadowLayer.shadowRadius = 0.8;
    
    
    //自定义阴影的形状
    //系统计算阴影需要消耗较大资源，如果可以确定形状的时候可以自定义形状。
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, self.shadowLayer.bounds);
    _shadowLayer.shadowPath = path;
    

//    [_layer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (IBAction)changeLayerContentScale:(id)sender {
    if (self.defaultScale) {
        _layer.contentsScale = 1.0;
    } else {
        _layer.contentsScale = 2.0;
    }
    self.defaultScale = !self.defaultScale;
}


- (IBAction)changeContentsRect:(id)sender {
    if (!self.defaultRect) {
        _layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    } else {
        _layer.contentsRect = CGRectMake(0, 0, 1, 1);
    }
    self.defaultRect = !self.defaultRect;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

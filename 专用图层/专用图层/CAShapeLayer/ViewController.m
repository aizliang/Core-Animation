//
//  ViewController.m
//  专用图层
//
//  Created by ai on 17/4/26.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAShapeLayer *matchstickMen;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawMatchsticMen];
    [self addRoundingRect];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)drawMatchsticMen {
    self.matchstickMen = [CAShapeLayer new];
    _matchstickMen.frame = self.view.bounds;
    [self.view.layer addSublayer:_matchstickMen];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 200) radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 250)];
    [path addLineToPoint:CGPointMake(150, 350)];
    [path addLineToPoint:CGPointMake(100, 400)];
    [path moveToPoint:CGPointMake(150, 350)];
    [path addLineToPoint:CGPointMake(200, 400)];
    [path moveToPoint:CGPointMake(100, 300)];
    [path addLineToPoint:CGPointMake(200, 300)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = 5.0;
    
    _matchstickMen.path = path.CGPath;
    _matchstickMen.strokeColor = [UIColor redColor].CGColor;
    _matchstickMen.fillColor = [UIColor clearColor].CGColor;
}


- (void)addRoundingRect {
    CAShapeLayer *rectLayer = [CAShapeLayer new];
    self.bgImageView.layer.mask = rectLayer;
    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:self.bgImageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(20, 20)];
    rectPath.lineWidth = 2.0;
    
    rectLayer.path = rectPath.CGPath;
    rectLayer.strokeColor = [UIColor orangeColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

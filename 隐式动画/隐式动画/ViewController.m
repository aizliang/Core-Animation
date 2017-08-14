//
//  ViewController.m
//  隐式动画
//
//  Created by ai on 17/5/27.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(100, 200, 100, 100);
    self.layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:self.layer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)show:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [CATransaction setCompletionBlock:^{
        CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        self.layer.transform = transform;
    }];
    [CATransaction setAnimationDuration:5];
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

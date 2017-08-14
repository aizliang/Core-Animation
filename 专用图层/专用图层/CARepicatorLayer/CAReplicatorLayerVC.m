//
//  ViewController.m
//  CAReplicatorLayer
//
//  Created by ai on 2017/4/29.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAReplicatorLayerVC.h"

@interface CAReplicatorLayerVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *sceneryView;

@property (weak, nonatomic) IBOutlet UIView *musicPlayigView;
@end

@implementation CAReplicatorLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.contents = (__bridge id)[UIImage imageNamed:@"2"].CGImage;
    layer.frame = self.sceneryView.bounds;
    [self.sceneryView.layer addSublayer:layer];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMusicPlaying:(id)sender {
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = self.musicPlayigView.bounds;
    layer.masksToBounds = YES;
    [self.musicPlayigView.layer addSublayer:layer];
    
    layer.instanceCount = 3;
    layer.instanceDelay = 0.3;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 40, 0, 0);
    layer.instanceTransform = transform;
    
    CALayer *rectLayer = [CALayer layer];
    rectLayer.frame = CGRectMake(55, 80, 30, 100);
    rectLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [layer addSublayer:rectLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue = @(rectLayer.position.y - 50);
    animation.duration = 0.7;
    animation.repeatCount = HUGE;
    animation.autoreverses = YES;
    
    [rectLayer addAnimation:animation forKey:@"musicAnimation"];
}

- (IBAction)showCAReplicatorLayer:(id)sender {
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:layer];
    layer.instanceCount = 10;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 60, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -60, 0);
    layer.instanceTransform = transform;
    
    layer.instanceGreenOffset = -0.1;
    layer.instanceBlueOffset = -0.1;
    layer.instanceDelay	 = 0.5;

    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(0, 0, 30, 30);
    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [layer addSublayer:subLayer];
    
}

@end

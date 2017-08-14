//
//  CAReplicatorLoadinfVC.m
//  专用图层
//
//  Created by ai on 17/5/1.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAReplicatorLoadingVC.h"

@interface CAReplicatorLoadingVC ()

@end

@implementation CAReplicatorLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showLoading:(id)sender {
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:replicatorLayer];
    
    replicatorLayer.instanceCount = 16;
    replicatorLayer.instanceDelay = 1.0f / 16.0f;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 100, 0);
    transform = CATransform3DRotate(transform, M_PI / 8, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -100, 0);
    
    replicatorLayer.instanceTransform = transform;
    [replicatorLayer addSublayer:[self createCircleLayer]];
}


- (CALayer *)createCircleLayer {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2, 20, 20);
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds];
    shapeLayer.path = circlePath.CGPath;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(1.0);
    scaleAnimation.toValue = @(0.1);
    scaleAnimation.duration = 1.0;
    scaleAnimation.repeatCount = HUGE;
    
    [shapeLayer addAnimation:scaleAnimation forKey:@"scaleLayer"];
    
    return  shapeLayer;
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

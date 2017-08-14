//
//  CAEmitterLayerVC.m
//  专用图层
//
//  Created by ai on 17/5/4.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAEmitterLayerVC.h"

@interface CAEmitterLayerVC ()
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;
@property (nonatomic, strong) CAEmitterCell *expressionCell;
@end

@implementation CAEmitterLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.backgroundColor = [UIColor redColor].CGColor;
    self.emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, -10);
    self.emitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width, -10);
    self.emitterLayer.emitterMode = kCAEmitterLayerOutline;
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    [self.view.layer addSublayer:_emitterLayer];
    
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    // Do any additional setup after loading the view.
}

- (IBAction)showCAEmitterLayer:(id)sender {
    self.expressionCell = [[CAEmitterCell alloc] init];
    _expressionCell.contents = (__bridge id)[UIImage imageNamed:@"酷"].CGImage;
    _expressionCell.birthRate = 1;
    _expressionCell.lifetime = 50;
    _expressionCell.velocity = 50;
    _expressionCell.velocityRange = 10;
    _expressionCell.yAcceleration = 10;
    _expressionCell.emissionRange = 0;
    _expressionCell.spin = 2.0;
    
    self.emitterLayer.emitterCells = @[_expressionCell];
}

- (IBAction)burst:(id)sender {
    CAEmitterLayer *burst = [CAEmitterLayer layer];
    burst.emitterPosition = CGPointMake(self.view.bounds.size.width / 2,self.view.bounds.size.height / 2);
    burst.emitterSize = CGSizeMake(10, 10);
    burst.emitterMode = kCAEmitterLayerPoints;
    burst.renderMode = kCAEmitterLayerAdditive;
    burst.emitterShape = kCAEmitterLayerPoint;
    [self.view.layer addSublayer:burst];
    
    CAEmitterCell *pointCell = [CAEmitterCell emitterCell];
    pointCell.name = @"point";
    pointCell.contents = (__bridge id)[UIImage imageNamed:@"point"].CGImage;
    pointCell.birthRate = 20;
    pointCell.lifetime = 50;
    pointCell.velocity = 50;
    pointCell.velocityRange = 30;
    pointCell.emissionRange = 2 * M_PI;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"emitterCells.point.birthRate"];
    animation.fromValue = @20;
    animation.toValue = @0;
    animation.duration = 5.0;
    [burst addAnimation:animation forKey:nil];
    
    
    burst.emitterCells = @[pointCell];
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

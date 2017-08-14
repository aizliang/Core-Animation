//
//  CAGradientLayerVC.m
//  专用图层
//
//  Created by ai on 17/4/29.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAGradientLayerVC.h"

@interface CAGradientLayerVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end

@implementation CAGradientLayerVC


- (IBAction)showGradienrLayer:(id)sender {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:layer];
    
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                     (__bridge id)[UIColor greenColor].CGColor,
                     (__bridge id)[UIColor blueColor].CGColor];
    layer.locations = @[@0.0,@0.5,@1.0];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

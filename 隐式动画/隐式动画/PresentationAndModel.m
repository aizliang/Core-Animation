//
//  PresentationAndModel.m
//  隐式动画
//
//  Created by ai on 17/5/27.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "PresentationAndModel.h"

@interface PresentationAndModel ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation PresentationAndModel

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 240, 120);
    self.colorLayer.backgroundColor = [UIColor blackColor].CGColor;
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.view.layer addSublayer:self.colorLayer];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        float blue = arc4random() / (CGFloat)INT_MAX;
        float red = arc4random() / (CGFloat)INT_MAX;
        float green = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
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

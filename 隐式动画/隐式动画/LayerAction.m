//
//  LayerAction.m
//  隐式动画
//
//  Created by ai on 17/5/27.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "LayerAction.h"

@interface LayerAction ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation LayerAction

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    _colorLayer.frame = self.bgView.bounds;
    _colorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.bgView.layer addSublayer:_colorLayer];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    self.colorLayer.actions = @{@"backgroundColor" : transition};
    // Do any additional setup after loading the view.
}

- (IBAction)clickButton:(id)sender {
    NSLog(@"%@",[self.bgView actionForLayer:self.bgView.layer forKey:@"backgroundColor"]);
    
    [UIView beginAnimations:@"test animation" context:@"test context"];
    NSLog(@"%@",[self.bgView actionForLayer:self.bgView.layer forKey:@"backgroundColor"]);
    
    self.bgView.bounds = CGRectMake(0, 0, 360, 120);
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(animationWillStart:context:)];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:context:)];
    [UIView commitAnimations];
    

    
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
}


//void * 是c语言层面的指向任意类型的指针   id是OC中指向任意对象的指针
- (void)animationWillStart:(NSString *)animationID context:(void *)context {
    NSLog(@"%@ \n %@",animationID,context);
    NSLog(@"%s",__func__);
}

- (void)animationDidStop:(NSString *)animationID context:(void *)centext {
    
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

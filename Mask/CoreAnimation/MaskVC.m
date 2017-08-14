//
//  MaskVC.m
//  coreAnimation
//
//  Created by ai on 17/4/15.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "MaskVC.h"

@interface MaskVC ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@end

@implementation MaskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //CALayer的mask属性，让layer只显示mask轮廓内部界面。
    CALayer *maskLayer = [[CALayer alloc] init];
    UIImage *sunImage = [UIImage imageNamed:@"bg_sun"];
    maskLayer.frame = CGRectMake(100, 100, sunImage.size.width, sunImage.size.height);
    maskLayer.contents = (__bridge id _Nullable)(sunImage.CGImage);
    self.bgImage.layer.mask = maskLayer;
    
    //CALayer的拉伸属性
    self.bgImage.layer.minificationFilter = kCAFilterNearest;    //缩小拉伸，最近拉伸法，适合于像素变化明显
    self.bgImage.layer.magnificationFilter = kCAFilterLinear;    //放大拉伸，双线性拉伸过滤
    
    
    //layer的shouldRasterize属性让自图层的透明度都和layer一样，不设置的话子图层的透明度会被父图层影响。
    self.leftView.alpha = 0.5;
    
    self.rightView.alpha = 0.5;
    self.rightView.layer.shouldRasterize = YES;
    self.rightView.layer.contentsScale = [UIScreen mainScreen].scale;
    // Do any additional setup after loading the view from its nib.
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

//
//  mieDianVC.m
//  affineTransform
//
//  Created by ai on 17/4/21.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "MieDianVC.h"

@interface MieDianVC ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@end

@implementation MieDianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
}

- (IBAction)transform:(id)sender {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = transform;
    
    CATransform3D leftTransform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.leftImage.layer.transform = leftTransform;
    
    CATransform3D rightTransform = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.rightImage.layer.transform = rightTransform;
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

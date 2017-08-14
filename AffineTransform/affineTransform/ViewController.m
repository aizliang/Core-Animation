//
//  ViewController.m
//  affineTransform
//
//  Created by ai on 17/4/19.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *yellowImageView;
@property (weak, nonatomic) IBOutlet UITextField *xTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *yTextFeild;
@property (weak, nonatomic) IBOutlet UITextField *zTextField;
@property (weak, nonatomic) IBOutlet UITextField *dTextFeild;

@property (nonatomic, assign) float d;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.yellowImageView.layer.doubleSided = NO;     //doubleSided 属性决定了layer的背面是否被绘制，layer通过3D旋转180度可以看到背面，是一个相应的镜像图片，一般用不到背面直接设置成NO，可以节约GPU。
    [self.xTextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.yTextFeild addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.zTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.dTextFeild addTarget:self action:@selector(changeD) forControlEvents:UIControlEventEditingChanged];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)makeTransform:(id)sender {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, 200, 0);
    transform = CGAffineTransformRotate(transform, M_PI / 4);
    self.yellowImageView.transform = transform;
}


- (IBAction)rotationTranslateTransform:(id)sender {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformRotate(transform, M_PI / 4);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    self.yellowImageView.transform = transform;
}

- (IBAction)transformIdentity:(id)sender {
    self.yellowImageView.transform = CGAffineTransformIdentity;
    self.yellowImageView.layer.transform = CATransform3DIdentity;
}


- (void)textFieldDidChange:(id)sender {
    if (_d <= 0) {
        return;
    }
    
    UITextField *textField = (UITextField *)sender;
    float angle = [textField.text floatValue] / 180 * M_PI;
    if ([textField isEqual:_xTextFiled]) {
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1 / _d;
        transform3D = CATransform3DRotate(transform3D, angle, 1, 0, 0);
        self.yellowImageView.layer.transform = transform3D;
        
    } else if ([textField isEqual:_yTextFeild]) {
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1 / _d;
        transform3D = CATransform3DRotate(transform3D, angle, 0, 1, 0);
        self.yellowImageView.layer.transform = transform3D;
        
    } else if ([textField isEqual:_zTextField]) {
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1 / _d;
        transform3D = CATransform3DRotate(transform3D, angle, 0, 0, 1);
        self.yellowImageView.layer.transform = transform3D;
    }
}


- (void)changeD {
    self.d = [_dTextFeild.text floatValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

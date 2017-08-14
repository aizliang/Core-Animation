//
//  CATranformLayerVC.m
//  专用图层
//
//  Created by ai on 17/4/29.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CATranformLayerVC.h"

@interface CATranformLayerVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CATranformLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showCubic:(id)sender {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 500;
    self.containerView.layer.sublayerTransform = transform;
    
    transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    transform = CATransform3DRotate(transform, -M_PI_4, 1, 0, 0);
    transform = CATransform3DTranslate(transform, 130, 0, 0);
    CATransformLayer *cubicLayer = [self addCubicWithTrasform:transform];
    [self.containerView.layer addSublayer:cubicLayer];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, -M_PI_4, 0, 1, 0);
    transform = CATransform3DRotate(transform, -M_PI_4, 1, 0, 0);
    transform = CATransform3DTranslate(transform, -130, 0, 0);
    CATransformLayer *cubic2Layer = [self addCubicWithTrasform:transform];
    [self.containerView.layer addSublayer:cubic2Layer];
}




- (CATransformLayer *)addCubicWithTrasform:(CATransform3D)cubicTransform {
    CATransformLayer *cubic = [[CATransformLayer alloc] init];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 0, 50);
    CALayer *face1 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face1];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, -50, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    CALayer *face2 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face2];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 50, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    CALayer *face3 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face3];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, -50, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    CALayer *face4 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face4];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 50, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    CALayer *face5 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face5];
    
    transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 0, -50);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    CALayer *face6 = [self addFaceWithTransform:transform];
    [cubic addSublayer:face6];
    
    cubic.position = CGPointMake(self.containerView.bounds.size.width / 2, self.containerView.bounds.size.height / 2);
    cubic.transform = cubicTransform;
    return cubic;
}


- (CALayer *)addFaceWithTransform:(CATransform3D)transform {
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    float red = (rand() / (double)INT_MAX);
    float green = (rand() / (double)INT_MAX);
    float blue = (rand() / (double)INT_MAX);
    
    UIColor *faceColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    face.backgroundColor = faceColor.CGColor;
    
    face.transform = transform;
    return face;
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

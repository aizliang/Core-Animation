//
//  SolidVC.m
//  affineTransform
//
//  Created by ai on 17/4/21.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "SolidVC.h"
#import <GLKit/GLKit.h>

#define kwidth [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface SolidVC ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;
@property (weak, nonatomic) IBOutlet UIView *contrainerView;

@end

@implementation SolidVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contrainerView.backgroundColor = [UIColor grayColor];
    [self addFaces];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)addFaces {
    CATransform3D baseTransform = CATransform3DIdentity;
    baseTransform.m34 = -1 / 500;
    baseTransform = CATransform3DRotate(baseTransform, M_PI_4, 0, 1, 0);
    baseTransform = CATransform3DRotate(baseTransform, -M_PI_4, 1, 0, 0);
    self.contrainerView.layer.sublayerTransform = baseTransform;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:2 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:4 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    UIView *face = self.faces[index];
    face.frame = CGRectMake(kwidth / 2 - 100, kheight / 2 - 100, 200, 200);
    face.layer.borderWidth = 1.0;
    face.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.contrainerView addSubview:face];
    
    face.layer.transform = transform;
    [self applyLightingToFace:face.layer];
}


- (void)applyLightingToFace:(CALayer *)face {
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
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

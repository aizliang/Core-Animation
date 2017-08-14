//
//  ReflecationView.m
//  CAReplicatorLayer
//
//  Created by ai on 2017/4/30.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ReflecationView.h"

@implementation ReflecationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)setUp {
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;
    
    float offsetY = self.bounds.size.height;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, offsetY, 0);
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    layer.instanceTransform = transform;
    
    layer.instanceAlphaOffset = -0.6;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}
@end

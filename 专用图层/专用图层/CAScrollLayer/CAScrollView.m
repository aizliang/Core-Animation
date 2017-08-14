//
//  CAScrollView.m
//  专用图层
//
//  Created by ai on 17/5/3.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAScrollView.h"

@implementation CAScrollView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    self.layer.masksToBounds = YES;
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
}

- (void)pan:(UIPanGestureRecognizer *)panGesture {
    CGPoint offset = self.bounds.origin;
    offset.x -= [panGesture translationInView:self].x;
    offset.y -= [panGesture translationInView:self].y;
    
    [(CAScrollLayer *)self.layer scrollPoint:offset];
    [panGesture setTranslation:CGPointZero inView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  LayerLabel.m
//  专用图层
//
//  Created by ai on 17/4/28.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


+ (Class)layerClass {
    return [CATextLayer class];
}

- (CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}

- (void)setUp {
    [self textLayer].alignmentMode = kCAAlignmentLeft;
    [self textLayer].wrapped = YES;
    [self.layer display];
}


-(void)setText:(NSString *)text {
    [super setText:text];
    [self textLayer].string = text;
}


- (void)setTextColor:(UIColor *)textColor {
    [super setTextColor:textColor];
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    CGFontRef fontRef = CGFontCreateWithFontName((__bridge CFStringRef)font.fontName);
    
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}

@end

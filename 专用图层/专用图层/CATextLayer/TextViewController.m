//
//  TextViewController.m
//  专用图层
//
//  Created by ai on 17/4/27.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "TextViewController.h"
#import <CoreText/CoreText.h>
#import "LayerLabel.h"

@interface TextViewController ()

@property (weak, nonatomic) IBOutlet UIView *textView;
@property (nonatomic, strong) CATextLayer *textLayer;

@property (nonatomic, strong) LayerLabel *layerLabel;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addTextToString:(id)sender {
    self.textLayer.foregroundColor = [UIColor blackColor].CGColor;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis";
    self.textLayer.string = text;
}

- (IBAction)addAttributeToView:(id)sender {
    UIFont *font = [UIFont systemFontOfSize:15];
    CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis";
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSDictionary *attributs = @{(__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor blackColor].CGColor,
                                (__bridge id)kCTFontAttributeName : (__bridge id)fontRef};
    [attributeString setAttributes:attributs range:NSMakeRange(0, attributeString.length)];
    
    
    attributs = @{(__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor redColor].CGColor,
                  (__bridge id)kCTFontAttributeName : (__bridge id)fontRef,
                  (__bridge id)kCTUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle)};
    [attributeString setAttributes:attributs range:NSMakeRange(6, 5)];
    
    
    self.textLayer.string = attributeString;
}

- (IBAction)showLayerLabel:(id)sender {
    self.layerLabel = [[LayerLabel alloc] initWithFrame:CGRectMake(130, 550, 150, 30)];
    [self.view addSubview:self.layerLabel];
    self.layerLabel.text = @"layerLbale Text";
    self.layerLabel.textColor = [UIColor redColor];
    self.layerLabel.font = [UIFont systemFontOfSize:15];
    
}

- (IBAction)showLabel:(id)sender {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 600, 150, 30)];
    [self.view addSubview:label];
    label.text = @"label textString";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentLeft;
}


- (CATextLayer *)textLayer {
    if (!_textLayer) {
        _textLayer = [[CATextLayer alloc] init];
        _textLayer.frame = _textView.bounds;
        _textLayer.contentsScale = [UIScreen mainScreen].scale;
        [_textView.layer addSublayer:_textLayer];
        
        _textLayer.alignmentMode = kCAAlignmentLeft;
        _textLayer.wrapped = YES;
    }
    return _textLayer;
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

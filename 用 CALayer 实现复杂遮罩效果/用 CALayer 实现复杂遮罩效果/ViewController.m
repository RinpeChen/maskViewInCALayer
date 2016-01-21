//
//  ViewController.m
//  用 CALayer 实现复杂遮罩效果
//
//  Created by RinpeChen on 16/1/20.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) CALayer *maskViewLayer;

@property (nonatomic, strong) UIImage *contentImage;
@property (nonatomic, strong) UIImage *maskViewContentImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.contentImage = [UIImage imageNamed:@"原始图片"];
    self.maskViewContentImage = [UIImage imageNamed:@"maskLayerContents"];
    
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = CGRectMake(0, 0, 200, 200);
    self.imageLayer.contents = (id)self.contentImage.CGImage;
    
    self.maskViewLayer = [CALayer layer];
    self.maskViewLayer.frame = CGRectMake(-200, -200, 200, 200);
    self.maskViewLayer.contents = (id)self.maskViewContentImage.CGImage;
    
    // self.imageLayer的局部区域的显示与否可以通过mask的alpha通道来决定
    self.imageLayer.mask = self.maskViewLayer;
    
    [self.view.layer addSublayer:self.imageLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.maskViewLayer.frame = self.imageLayer.bounds;
}

@end

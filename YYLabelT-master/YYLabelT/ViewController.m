//
//  ViewController.m
//  YYLabelT
//
//  Created by anlaiye_huangxinyu on 16/6/29.
//  Copyright © 2016年 Hxy. All rights reserved.
//

#import "ViewController.h"
#import <YYLabel.h>
#import "NSAttributedString+YYText.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    YYLabel *label = [YYLabel new];
    label.frame = CGRectMake(100, 100, 100, 25);
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = 0;
    label.numberOfLines = NSLineBreakByWordWrapping;
    label.text = @"YYTextDemo Test";
    [self.view addSubview:label];
    
    
    
    //属性字符串 简单实用
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
    text.yy_font = [UIFont boldSystemFontOfSize:13.0f];
    text.yy_color = [UIColor blueColor];
    [text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
    
    
    YYLabel *attributedLabel = [YYLabel new];
    attributedLabel.frame = CGRectMake(100, 200, 160, 25);
    attributedLabel.attributedText = text;
    attributedLabel.userInteractionEnabled = YES;
    attributedLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:attributedLabel];
    
    //高亮字符串 包含点击事件
    {
        [text yy_setTextHighlightRange:NSMakeRange(0, 4)
                                 color:[UIColor orangeColor]
                       backgroundColor:[UIColor whiteColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                 NSLog(@"tap text range:...");
                             }];
        
    }
    
    YYLabel *heightRangeLabel = [YYLabel new];
    heightRangeLabel.frame = CGRectMake(100, 250, 160, 25);
    heightRangeLabel.attributedText = text;
    heightRangeLabel.userInteractionEnabled = YES;
    heightRangeLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:heightRangeLabel];
    
    
    //图文混排模式
    NSMutableAttributedString *textImage = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    
    {
        NSString *title = @"图文混排,图片必须满足64位:";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
        image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    
    {
        NSString *title = @"text 与 UIView混排：";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UISwitch *switcher = [UISwitch new];
        switcher.frame= CGRectMake(0, 0, 50, 50);
        [switcher sizeToFit];
        
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:switcher contentMode:UIViewContentModeCenter attachmentSize:switcher.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    {
        NSString *title = @"text 与 UIImageView混排：";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImageView *imageView = [UIImageView new];
        imageView.frame= CGRectMake(0, 0, 20, 20);
        [imageView setImage:[UIImage imageNamed:@"psbs"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    
    {
        [textImage yy_setTextHighlightRange:NSMakeRange(0, 8)
                                      color:[UIColor orangeColor]
                            backgroundColor:[UIColor whiteColor]
                                  tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                      NSLog(@"tap text range:...");
                                  }];
        
    }
    
    textImage.yy_font = font;
    YYLabel *textImageLabel = [YYLabel new];
    textImageLabel.userInteractionEnabled = YES;
    textImageLabel.numberOfLines = 0;
    textImageLabel.frame = CGRectMake(100, 280, 250, 200);
    textImageLabel.attributedText = textImage;
    [self.view addSubview:textImageLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

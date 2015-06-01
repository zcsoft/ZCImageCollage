//
//  ZCImageCollage.m
//  ZCImageCollageDemo
//
//  Created by cuibo on 5/29/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ZCImageCollage.h"

@implementation ZCImageCollage

static CGSize contextSize;

//开始,并设定画布大小
+ (void)beginWithSize:(CGSize)size
{
    contextSize = size;
    UIGraphicsBeginImageContext(size);
}

//获取画布大小
+ (CGSize)getSize
{
    return contextSize;
}

//设置背景颜色
+ (void)setBackgroundColor:(UIColor *)color
{
    [color set];
    UIRectFill(CGRectMake(0, 0, contextSize.width, contextSize.height));
}

//添加一张照片
+ (void)addImage:(UIImage *)image inRect:(CGRect)rect
{
    [image drawInRect:rect];
}

//添加文字
+ (void)addText:(NSString *)string atPoint:(CGPoint)point font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    [string drawAtPoint:point withAttributes:[ZCImageCollage setAttributesWithFont:font WithTextColor:color WithAlignment:alignment]];
}

//结束并获得合成图片
+ (UIImage *)end
{
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();//从当前环境当中得到重绘的图片
    UIGraphicsEndImageContext();//关闭当前环境
    
    return newImage;
}


//截取视图成image，不能在beginWithSize:和end之间使用。
+ (UIImage *)captureView:(UIView *)view
{
    [ZCImageCollage beginWithSize:view.frame.size];
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    return [ZCImageCollage end];
}

#pragma mark - 
#pragma mark - 工具

//设置文本样式字典
+ (NSDictionary *)setAttributesWithFont:(UIFont *)font WithTextColor:(UIColor *)color WithAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *paragraphStyle= [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = alignment;
    NSDictionary *attributes= [NSDictionary dictionaryWithObjectsAndKeys:
                               font, NSFontAttributeName,                           //字体
                               paragraphStyle,NSParagraphStyleAttributeName,        //样式
                               color,NSForegroundColorAttributeName,                //颜色
//                              [UIColor blackColor],NSStrokeColorAttributeName,
//                              [NSNumber numberWithFloat:2.0],NSStrokeWidthAttributeName,
                               nil];
    return attributes;
}


@end

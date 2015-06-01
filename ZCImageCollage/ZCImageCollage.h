//
//  ZCImageCollage.h
//  ZCImageCollageDemo
//
//  Created by cuibo on 5/29/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCImageCollage : NSObject

//开始,并设定画布大小
+ (void)beginWithSize:(CGSize)size;

//获取画布大小
+ (CGSize)getSize;

//设置背景颜色
+ (void)setBackgroundColor:(UIColor *)color;

//添加一张照片
+ (void)addImage:(UIImage *)image inRect:(CGRect)rect;

//添加文字
+ (void)addText:(NSString *)string atPoint:(CGPoint)point font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;

//结束并获得合成图片
+ (UIImage *)end;

@end


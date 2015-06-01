//
//  ViewController.m
//  ZCImageCollageDemo
//
//  Created by cuibo on 5/29/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ViewController.h"
#import "ZCImageCollage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *tagView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(id)sender
{
    UIImage *image1 = [UIImage imageNamed:@"1"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    //[image stretchableImageWithLeftCapWidth:200 topCapHeight:200];
    
    //创建画布
    [ZCImageCollage beginWithSize:(CGSize){300,300}];
    //设置背景颜色
    [ZCImageCollage setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:1.0]];
    
    //添加图片和文字
    [ZCImageCollage addImage:image1 inRect:CGRectMake(0, 0, 200, 200)];
    [ZCImageCollage addImage:image2 inRect:CGRectMake(100, 100, 200, 200)];
    [ZCImageCollage addText:@"文字测试 text test."
                    atPoint:(CGPoint){10,220}
                       font:[UIFont boldSystemFontOfSize:20]
                      color:[UIColor whiteColor]
                  alignment:NSTextAlignmentLeft];
    
    UIImage *newImage = [ZCImageCollage end];
    
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil);
    
    //显示到界面
    [self.imageView setImage:newImage];
}

@end

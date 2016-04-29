//
//  ViewController.m
//  ZLPhotoBrowser
//
//  Created by long on 15/12/1.
//  Copyright © 2015年 long. All rights reserved.
//

#import "ViewController.h"
#import "ZLPhotoActionSheet.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
///////////////////////////////////////////////////
// git 地址： https://github.com/longitachi/ZLPhotoBrowser
// 喜欢的朋友请去给个star，莫大的支持，谢谢
///////////////////////////////////////////////////
@interface ViewController ()
{
    ZLPhotoActionSheet *actionSheet;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    actionSheet = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet.maxSelectCount = 5;
    //设置照片最大预览数
    actionSheet.maxPreviewCount = 20;
}

- (IBAction)btnSelectPhoto_Click:(id)sender
{
    __weak typeof(self) weakSelf = self;
    [actionSheet showWithSender:self animate:YES completion:^(NSArray<ZLSelectPhotoModel *> * _Nonnull selectPhotos) {
        [weakSelf.baseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        NSLog(@"%@",selectPhotos);
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width/4-2;
        for (int i = 0; i < selectPhotos.count; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i%4*(width+2), i/4*(width+2), width, width)];
            ZLSelectPhotoModel *zlmodel=selectPhotos[i];
            const char* queueName = [[[NSDate date] description] UTF8String];
             dispatch_async(dispatch_queue_create(queueName,NULL), ^{
                 [ZLSelectPhotoModel getVideoFromPHAsset:zlmodel.asset Complete:^(NSString *filePath, NSString *fileName) {
                     NSLog(@"%@~~~~~%@",filePath,fileName);
                 }];
             });
            imgView.image = zlmodel.image;
            [weakSelf.baseView addSubview:imgView];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

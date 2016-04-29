//
//  ZLBigImageCell.h
//  多选相册照片
//
//  Created by long on 15/11/26.
//  Copyright © 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPlayer.h"
@interface ZLBigImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) IBOutlet UIButton *videoBtn;

- (void)showIndicator;

- (void)hideIndicator;

@end

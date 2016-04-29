//
//  ZLCollectionCell.h
//  多选相册照片
//
//  Created by long on 15/11/25.
//  Copyright © 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface ZLCollectionCell : UICollectionViewCell
@property (nonatomic, strong) PHAsset *asset;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (strong, nonatomic) IBOutlet UIImageView *typeImageView;
@property (strong, nonatomic) IBOutlet UILabel *timeLable;

@end

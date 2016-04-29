//
//  ZLCollectionCell.m
//  多选相册照片
//
//  Created by long on 15/11/25.
//  Copyright © 2015年 long. All rights reserved.
//

#import "ZLCollectionCell.h"

@implementation ZLCollectionCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setAsset:(PHAsset *)asset
{
    self.typeImageView.hidden=YES;
    self.timeLable.hidden=YES;
    if (asset.mediaType==PHAssetMediaTypeVideo) {
        self.typeImageView.hidden=NO;
        self.timeLable.hidden=NO;
        self.timeLable.text=[self getTime:asset.duration];
    }
}
- (NSString *)getTime:(NSTimeInterval)time
{
    int dtime=time;
    if (dtime>=3600) {
        return [NSString stringWithFormat:@"%.2d:%.2d:%.2d",dtime/3600,dtime%3600,dtime%60];
    }else if (dtime>=60) {
        return [NSString stringWithFormat:@"%.2d:%.2d",dtime/60,dtime%60];
    }else if (dtime>0) {
        return [NSString stringWithFormat:@"00:%.2d",dtime/1];
    }
    return @"00:01";
}
@end

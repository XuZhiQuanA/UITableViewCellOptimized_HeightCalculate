//
//  FrameTableViewCell.h
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FrameModel;

NS_ASSUME_NONNULL_BEGIN

@interface FrameTableViewCell : UITableViewCell

@property(nonatomic,strong) FrameModel *model;

+ (CGFloat)heightWithModel:(FrameModel *)model;

@end

NS_ASSUME_NONNULL_END

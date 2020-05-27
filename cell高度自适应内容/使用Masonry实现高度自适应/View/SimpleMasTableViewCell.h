//
//  SimpleMasTableViewCell.h
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasModel;

NS_ASSUME_NONNULL_BEGIN

@interface SimpleMasTableViewCell : UITableViewCell

@property(nonatomic,strong) MasModel *model;

@end

NS_ASSUME_NONNULL_END

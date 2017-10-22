//
//  AWESegmentControl.h
//  SegmentControl
//
//  Created by 王霄 on 2017/10/22.
//  Copyright © 2017年 王霄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWESegmentControl;
@protocol AWESegmentControlProtocol
@required
- (void)segmentControlTapped:(AWESegmentControl *)segmentControl index:(NSInteger)index;
@end

@interface AWESegmentControl : UIView
@property (nonatomic, assign) NSInteger segmentItemPadding;
@property (nonatomic, assign) NSInteger initialSelectedIndex;
@property (nonatomic, weak) id<AWESegmentControlProtocol> delegate;
- (instancetype)initWithTitleArray:(NSArray *)array;
@end

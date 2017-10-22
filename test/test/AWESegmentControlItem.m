//
//  AWESegmentControlItem.m
//  SegmentControl
//
//  Created by 王霄 on 2017/10/22.
//  Copyright © 2017年 王霄. All rights reserved.
//

#import "AWESegmentControlItem.h"
#import <Masonry.h>

@implementation AWESegmentControlItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _bottomLineViewHeight = 2;
        _bottomLineViewPadding = 15;
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.userInteractionEnabled = NO;
    [self addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self.bottomLineView.superview);
        make.height.equalTo(@(self.bottomLineViewHeight)); 
        make.leading.equalTo(self.bottomLineView.superview).offset(self.bottomLineViewPadding);
        make.trailing.equalTo(self.bottomLineView.superview).offset(-self.bottomLineViewPadding);
    }];
    self.bottomLineView.hidden = YES;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.bottomLineView.hidden = NO;
    }
    else {
        self.bottomLineView.hidden = YES;
    }
    [super setSelected:selected];
}

@end

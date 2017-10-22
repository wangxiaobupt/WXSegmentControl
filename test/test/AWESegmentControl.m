//
//  AWESegmentControl.m
//  SegmentControl
//
//  Created by 王霄 on 2017/10/22.
//  Copyright © 2017年 王霄. All rights reserved.
//

#import "AWESegmentControl.h"
#import "AWESegmentControlItem.h"
#import <Masonry.h>

@interface AWESegmentControl ()
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) AWESegmentControlItem *selectedItem;

@end

@implementation AWESegmentControl

- (instancetype)initWithTitleArray:(NSArray *)array {
    _titleArray = array;
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _segmentItemPadding = 0;
        _itemArray = [NSMutableArray array];
        _initialSelectedIndex = 0;
        [self configureUI];
    }
    return self;
}

# pragma mark - UI

- (void)configureUI {
    if (self.titleArray.count == 0) {
        return;
    }
    UIView *lastView = nil;
    for (NSString *title in self.titleArray) {
        AWESegmentControlItem *item = [[AWESegmentControlItem alloc] init];
        [self configureItem:item withTitle:title];
        [item addTarget:self action:@selector(segmentItemTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemArray addObject:item];
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(item.superview);
        }];
        if (lastView == nil) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(item.superview).offset(self.segmentItemPadding);
            }];
        }
        else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(lastView.mas_trailing).offset(self.segmentItemPadding);
                make.width.equalTo(lastView);
            }];
        }
        lastView = item;
        
        NSInteger index = [self.itemArray indexOfObject:item];
        if (index == self.initialSelectedIndex) {
            item.selected = YES;
            self.selectedItem = item;
        }
        else {
            item.selected = NO;
        }
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(lastView.superview).offset(-self.segmentItemPadding);
    }];
}

- (void)configureItem:(AWESegmentControlItem *)item withTitle:(NSString *)title {
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    item.bottomLineView.backgroundColor = [UIColor redColor];
}

# pragma mark - Setter

- (void)setInitialSelectedIndex:(NSInteger)initialSelectedIndex {
    if (initialSelectedIndex < self.itemArray.count) {
        [self segmentItemTapped:self.itemArray[initialSelectedIndex]];
    }
}

# pragma mark - Delegate

- (void)segmentItemTapped:(AWESegmentControlItem *)item {
    if (item == self.selectedItem) {
        return;
    }
    self.selectedItem.selected = NO;
    self.selectedItem = item;
    self.selectedItem.selected = YES;
    NSInteger index = [self.itemArray indexOfObject:item];
    [self.delegate segmentControlTapped:self index:index];
}

@end

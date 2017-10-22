//
//  ViewController.m
//  test
//
//  Created by 王霄 on 2017/10/22.
//  Copyright © 2017年 王霄. All rights reserved.
//

#import "ViewController.h"
#import "AWESegmentControl.h"
#import <Masonry.h>

@interface ViewController () <AWESegmentControlProtocol>
@property (nonatomic, strong) AWESegmentControl *segmentControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.segmentControl = [[AWESegmentControl alloc] initWithTitleArray:@[@"用户",@"挑战",@"音乐"]];
    self.segmentControl.backgroundColor = [UIColor blackColor];
    self.segmentControl.delegate = self;
    self.segmentControl.initialSelectedIndex = 2;
    [self.view addSubview:self.segmentControl];
    [self.segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.segmentControl.superview);
        make.top.equalTo(self.segmentControl.superview).offset(64);
        make.height.equalTo(@50);
    }];
}

- (void)segmentControlTapped:(AWESegmentControl *)segmentControl index:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}



@end

//
//  KMSoureCodeViewController.m
//  KMSplitView
//
//  Created by Cocoon Jin on 15/8/3.
//  Copyright © 2015年 kdanmobile. All rights reserved.
//

#import "KMSoureCodeViewController.h"
#import "Masonry.h"

@interface KMSoureCodeViewController ()

@property (nonatomic, strong) UIView* greenView;

@property (nonatomic, strong) UIView* redView;

@property (nonatomic, strong) UIView* blueView;

@end

@implementation KMSoureCodeViewController

#pragma mark life cycle

- (id) init {
    if (self = [super init]) {
        self.title = @"PlainCode Implement";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view
    
    // add subviews
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    
    // layout all subviews
    [self layoutAllSubviews:(UIUserInterfaceSizeClassCompact == self.view.traitCollection.horizontalSizeClass)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.greenView = nil;
    self.redView = nil;
    self.blueView = nil;
    // Dispose of any resources that can be recreated.
}


- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if (UIUserInterfaceSizeClassCompact == newCollection.horizontalSizeClass) {
        NSLog(@"compact layout");
        [self layoutAllSubviews:YES];
    } else {
        NSLog(@"reguar layout");
        [self layoutAllSubviews:NO];
    }
}

- (void) layoutAllSubviews:(BOOL)isCompactLayout {
    
    UIView *superview = self.view;
    int padding = 20;
    if (isCompactLayout) {
        [self.greenView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).offset(padding);
            make.bottom.equalTo(self.redView.mas_top).offset(-padding);
            make.left.equalTo(superview.mas_left).offset(padding);
            make.right.equalTo(superview.mas_right).offset(-padding);
            make.height.equalTo(@[self.redView,self.blueView]);
        }];
        
        [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.greenView.mas_bottom).offset(padding);
            make.bottom.equalTo(self.blueView.mas_top).offset(-padding);
            make.left.equalTo(self.greenView);
            make.right.equalTo(self.greenView);
            make.height.equalTo(@[self.greenView,self.blueView]);
        }];
        
        [self.blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.redView.mas_bottom).offset(padding);
            make.bottom.equalTo(superview.mas_bottom).offset(-padding);
            make.left.equalTo(self.greenView);
            make.right.equalTo(self.greenView);
            make.height.equalTo(@[self.redView,self.greenView]);
        }];
        
    } else {
        [self.greenView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
            make.left.equalTo(superview.mas_left).offset(padding);
            make.bottom.equalTo(self.blueView.mas_top).offset(-padding);
            make.right.equalTo(self.redView.mas_left).offset(-padding);
            make.width.equalTo(self.redView.mas_width);
            make.height.equalTo(@[self.redView,self.blueView]);
        }];
        
        [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).with.offset(padding); //with with
            make.left.equalTo(self.greenView.mas_right).offset(padding); //without with
            make.bottom.equalTo(self.blueView.mas_top).offset(-padding);
            make.right.equalTo(superview.mas_right).offset(-padding);
            make.width.equalTo(self.greenView.mas_width);
            make.height.equalTo(@[self.greenView,self.blueView]);
        }];
        
        [self.blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.greenView.mas_bottom).offset(padding);
            make.left.equalTo(superview.mas_left).offset(padding);
            make.bottom.equalTo(superview.mas_bottom).offset(-padding);
            make.right.equalTo(superview.mas_right).offset(-padding);
            make.height.equalTo(@[self.greenView, self.redView]);
        }];
    }
}

#pragma mark getter && setter
- (UIView*) greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = UIColor.greenColor;
        _greenView.layer.borderColor = UIColor.blackColor.CGColor;
        _greenView.layer.borderWidth = 2;
    }
    return _greenView;
}

- (UIView*) redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = UIColor.redColor;
        _redView.layer.borderColor = UIColor.blackColor.CGColor;
        _redView.layer.borderWidth = 2;
    }
    return _redView;
}

- (UIView*) blueView {
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = UIColor.blueColor;
        _blueView.layer.borderColor = UIColor.blackColor.CGColor;
        _blueView.layer.borderWidth = 2;
    }
    return _blueView;
}

@end

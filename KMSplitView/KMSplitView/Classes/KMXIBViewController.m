//
//  KMXIBViewController.m
//  KMSplitView
//
//  Created by Cocoon Jin on 15/8/3.
//  Copyright © 2015年 kdanmobile. All rights reserved.
//

#import "KMXIBViewController.h"

@interface KMXIBViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation KMXIBViewController

#pragma mark life cycle

- (id) initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"XIB Implement";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    
    // set border color
    self.greenView.layer.borderColor = UIColor.blackColor.CGColor;
    self.greenView.layer.borderWidth = 2;
    
    self.redView.layer.borderColor = UIColor.blackColor.CGColor;
    self.redView.layer.borderWidth = 2;
    
    self.blueView.layer.borderColor = UIColor.blackColor.CGColor;
    self.blueView.layer.borderWidth = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

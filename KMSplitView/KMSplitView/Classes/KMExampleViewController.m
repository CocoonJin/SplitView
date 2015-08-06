//
//  KMExampleViewController.m
//  KMSplitView
//
//  Created by Cocoon Jin on 15/8/3.
//  Copyright © 2015年 kdanmobile. All rights reserved.
//

#import "KMExampleViewController.h"
#import "KMSoureCodeViewController.h"
#import "KMXIBViewController.h"

static NSString* kCellReuseIdentifier = @"CellReuseIdentifier";

@interface KMExampleViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSArray* exampleVCs;

@end

@implementation KMExampleViewController

#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS 9 Split View Example";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //add subviews
    [self.view addSubview:self.tableView];
    
    //load datas
    self.exampleVCs = @[ [[KMSoureCodeViewController alloc]init],
                         [[KMXIBViewController alloc] initWithNibName:@"KMXIBViewController" bundle:nil],
                       ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark getter && setter

- (UITableView*) tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    UIViewController *viewController = self.exampleVCs[indexPath.row];
    cell.textLabel.text = viewController.title;
    if (indexPath.row %2) {
        cell.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:236.0/255.0 blue:250.0/255.0 alpha:1.0];
    } else {
        cell.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1.0];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleVCs.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *viewController = self.exampleVCs[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end

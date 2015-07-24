//
//  SHViewController.m
//  SHMultipleSelect
//
//  Created by Shamsiddin Saidov on 07/22/2015.
//  Copyright (c) 2015 shamsiddin.saidov@gmail.com. All rights reserved.
//

#import "SHViewController.h"

@interface SHViewController ()
- (void)btnClick;
@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect mainScreenRect = [[UIScreen mainScreen] bounds];
    
    _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.frame = CGRectMake((mainScreenRect.size.width - 70)/2, 200, 70, 40);
    [_btn setTitle:@"Open" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _dataSource = [[NSMutableArray alloc] initWithObjects:@"James", @"Robert", @"Michael", @"William", @"David", @"Richard", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick {
    SHMultipleSelect *multipleSelect = [[SHMultipleSelect alloc] init];
    multipleSelect.delegate = self;
    multipleSelect.rowsCount = _dataSource.count;
    [multipleSelect show];
}

#pragma mark - SHMultipleSelectDelegate
- (void)multipleSelectView:(SHMultipleSelect*)multipleSelectView clickedBtnAtIndex:(NSInteger)clickedBtnIndex withSelectedIndexPaths:(NSArray *)selectedIndexPaths {
    if (clickedBtnIndex == 1) { // Done btn
        for (NSIndexPath *indexPath in selectedIndexPaths) {
            NSLog(@"%@", _dataSource[indexPath.row]);
        }
    }
}

- (NSString*)multipleSelectView:(SHMultipleSelect*)multipleSelectView titleForRowAtIndexPath:(NSIndexPath*)indexPath {
    return _dataSource[indexPath.row];
}

- (BOOL)multipleSelectView:(SHMultipleSelect*)multipleSelectView setSelectedForRowAtIndexPath:(NSIndexPath*)indexPath {
    BOOL canSelect = NO;
    if (indexPath.row == _dataSource.count - 1) { // last object
        canSelect = YES;
    }
    return canSelect;
}


@end

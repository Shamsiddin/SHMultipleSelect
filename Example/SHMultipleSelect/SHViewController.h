//
//  SHViewController.h
//  SHMultipleSelect
//
//  Created by Shamsiddin Saidov on 07/22/2015.
//  Copyright (c) 2015 shamsiddin.saidov@gmail.com. All rights reserved.
//

#import <SHMultipleSelect/SHMultipleSelect.h>
@import UIKit;

@interface SHViewController : UIViewController<SHMultipleSelectDelegate> {
    UIButton *_btn;
    NSMutableArray *_dataSource;
}

@end

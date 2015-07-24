# SHMultipleSelect

SHMultipleSelect is an easy-to-use multiple selection view for iOS 7+.

![ScreenShots](ScreenShots/shmultipleselect.png width=320px height=480px)

Created by Shamsiddin
https://www.linkedin.com/in/shamsiddin

## Usage

* Copy class files from `Pod/Classes` folder to your project
* Import `SHMultipleSelect.h` and implement `SHMultipleSelectDelegate` protocol
* See Demo project for details

##Delegate methods

```objective-c
- (void)multipleSelectView:(SHMultipleSelect*)multipleSelectView clickedBtnAtIndex:(NSInteger)clickedBtnIndex withSelectedIndexPaths:(NSArray*)selectedIndexPaths;
- (NSString*)multipleSelectView:(SHMultipleSelect*)multipleSelectView titleForRowAtIndexPath:(NSIndexPath*)indexPath;
- (BOOL)multipleSelectView:(SHMultipleSelect*)multipleSelectView setSelectedForRowAtIndexPath:(NSIndexPath*)indexPath;
```

```objective-c
#pragma mark - SHMultipleSelectDelegate

- (void)multipleSelectView:(SHMultipleSelect *)multipleSelectView clickedBtnAtIndex:(NSInteger)clickedBtnIndex withSelectedIndexPaths:(NSArray *)selectedIndexPaths {
    if (clickedBtnIndex == 1) { // Done btn
        for (NSIndexPath *indexPath in selectedIndexPaths) {
            NSLog(@"%@", _dataSource[indexPath.row]);
        }
    }
}

- (NSString *)multipleSelectView:(SHMultipleSelect *)multipleSelectView titleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataSource[indexPath.row];
}

- (BOOL)multipleSelectView:(SHMultipleSelect *)multipleSelectView setSelectedForRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL canSelect = NO;
    if (indexPath.row == _dataSource.count - 1) { // last object
        canSelect = YES;
    }
    return canSelect;
}
```

##ARC

SHMultipleSelect uses ARC (Automatic Reference Counting).

If you are using SHMultipleSelect in your non-arc project, you will need to set a `-fobjc-arc` compiler flag on all of the SHMultipleSelect source files.

To set a compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Now select all SHMultipleSelect source files, press Enter, insert `-fobjc-arc` and then "Done" to disable ARC for SHMultipleSelect.

##Uses Frameworks

* UIKit.framework
* Foundation.framework
* QuartzCore.framework

## License

SHMultipleSelect is available under the MIT license. See the LICENSE file for more info.

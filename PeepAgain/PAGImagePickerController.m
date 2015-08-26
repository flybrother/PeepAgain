//
//  PAGImagePickerController.m
//  PeepAgain
//
//  Created by 李翔 on 8/26/15.
//  Copyright (c) 2015 Xiang Li. All rights reserved.
//

#import "PAGImagePickerController.h"

@interface PAGImagePickerController ()

@end

@implementation PAGImagePickerController {
    UIViewController *sViewController;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.showsCameraControls = NO;
    }
    return self;
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:0.7
                                     target:self
                                   selector:@selector(takePicture)
                                   userInfo:nil
                                    repeats:NO];

}

- (void)takePicture {
    NSLog(@"Taking the picture now");
    [super takePicture];
}


@end

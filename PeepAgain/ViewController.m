//
//  ViewController.m
//  PeepAgain
//
//  Created by 李翔 on 8/24/15.
//  Copyright (c) 2015 Xiang Li. All rights reserved.
//

#import "ViewController.h"
#import "PAGImagePickerController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pickImageButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    self.view.backgroundColor = [UIColor blackColor];
    
    self.imageView.userInteractionEnabled = YES;
    self.imageView.hidden = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSDictionary *viewsDictionary = @{@"imageView":self.imageView};
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[imageView]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(punish:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeRecognizer];
    
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(punish:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:swipeRecognizer];
}

- (void)punish:(UISwipeGestureRecognizer *)recognizer {
    PAGImagePickerController *spyCamera =[[PAGImagePickerController alloc] init];
    spyCamera.delegate = self;
    [self presentViewController:spyCamera animated:NO completion:nil];
}

- (IBAction)pickImageAction:(id)sender {
    UIImagePickerController *albumPicker = [[UIImagePickerController alloc] init];
    albumPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    albumPicker.delegate = self;
    [self presentViewController:albumPicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.imageView setImage:image];
        self.imageView.hidden = NO;
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
@end

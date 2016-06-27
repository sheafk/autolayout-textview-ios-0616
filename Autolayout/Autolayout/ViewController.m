//
//  ViewController.m
//  Autolayout
//
//  Created by Shea Furey-King on 6/27/16.
//  Copyright © 2016 Shea Furey-King. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *mainText;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (nonatomic, strong) NSLayoutConstraint *textViewBottomContraint; //Advanced Section

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton removeConstraints:self.rightButton.constraints];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton removeConstraints:self.leftButton.constraints];
    self.mainText.translatesAutoresizingMaskIntoConstraints = NO;
    [self.mainText removeConstraints:self.mainText.constraints];
    
    
        [self.rightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active=YES; //RIGHT
        [self.rightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active=YES;
        
        [self.leftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active=YES; //LEFT
        [self.leftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active=YES;
        
        [self.mainText.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active=YES;
        [self.mainText.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active=YES;
        [self.mainText.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active=YES;
        //Advanced Section Code Below
        self.textViewBottomContraint = [self.mainText.bottomAnchor constraintEqualToAnchor:self.leftButton.topAnchor constant:-20];
    

    
    self.textViewBottomContraint.active = YES;
    
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    //Size comes with two properties: height and width / Extra Credit Section Below
    
    if (size.height > size.width) {
        
        self.textViewBottomContraint.constant = -20;
    }
    
    else {
        
        self.textViewBottomContraint.constant = -10;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

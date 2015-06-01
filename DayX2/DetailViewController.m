//
//  DetailViewController.m
//  DayX2
//
//  Created by jonathan thornburg on 5/31/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation DetailViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (IBAction)clearButtonTapped:(id)sender {
    self.detailTextField.text = @"";
    self.detailTextView.text = @"";
}
- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.detailTextField.text;
        self.entry.bodyText = self.detailTextView.text;
        self.entry.timestamp = [NSDate date];
        [[EntryController sharedInstance] saveToPersistentStorage];
        
    } else {
        self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.detailTextField.text bodyText:self.detailTextView.text];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)updateWithEntry:(Entry *)entry
{
    self.detailTextField.text = entry.title;
    self.detailTextView.text = entry.bodyText;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateWithEntry:self.entry];
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

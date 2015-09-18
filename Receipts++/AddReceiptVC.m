//
//  AddReceiptVC.m
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import "AddReceiptVC.h"
#import "CoreDataHelperMethods.h"
#import "Receipt.h"

@interface AddReceiptVC ()
@property (weak, nonatomic) IBOutlet UITextField *receiptAmountTextField;
@property (weak, nonatomic) IBOutlet UITextView *receiptDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *foodTagButton;
@property (weak, nonatomic) IBOutlet UIButton *businessTagButton;
@property (weak, nonatomic) IBOutlet UIButton *billsTagButton;
@property (weak, nonatomic) IBOutlet UIButton *entertainmentTagButton;

@end

@implementation AddReceiptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (IBAction)foodTagSelected:(id)sender {
}
- (IBAction)businessTagSelected:(id)sender {
}
- (IBAction)billsTagSelected:(id)sender {
}
- (IBAction)entertainmentTagSelected:(id)sender {
}
- (IBAction)addReceipt:(id)sender {
    if (self.receiptDescriptionTextView.text) {
        if (self.receiptAmountTextField.text) {
            Receipt *newReceipt = [Receipt createReceipt];
            newReceipt.amount = [NSDecimalNumber decimalNumberWithString:self.receiptAmountTextField.text];
            newReceipt.receiptDescription = self.receiptDescriptionTextView.text;
            newReceipt.timeStamp = [NSDate date];
            [CoreDataHelperMethods saveNewReceipt:newReceipt];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

@end

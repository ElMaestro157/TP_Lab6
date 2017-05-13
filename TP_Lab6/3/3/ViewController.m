//
//  ViewController.m
//  3
//
//  Created by Admin on 06.05.17.
//  Copyright (c) 2017 Popov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indicator;
@property (weak, nonatomic) IBOutlet UITextField *field;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refresh:(id)sender {
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=3ef5dcaa905ffe8dcb4d910a412453e3", self.field.text]];
    NSData * contents = [[NSData alloc] initWithContentsOfURL:url];
    
    if (contents)
    {
        NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData:contents options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary* main = [[NSDictionary alloc] initWithDictionary:[forcasting valueForKey:@"main"]];
        
        NSNumber *temp = [main valueForKey:@"temp"];
        double t = [temp doubleValue] - 273.15;
        
        if (t < 0){
            [[self indicator] setTextColor:[UIColor blueColor]];
        }
        
        else if (t < 20){
            [[self indicator] setTextColor:[UIColor greenColor]];
        }
        else {
            [[self indicator] setTextColor:[UIColor redColor]];
        }
        
        [[self indicator] setText:[NSString stringWithFormat:@"%.1f C", t]];
    }
    else
    {
        [[self indicator] setText:@"No data"];
    }
    
}

@end

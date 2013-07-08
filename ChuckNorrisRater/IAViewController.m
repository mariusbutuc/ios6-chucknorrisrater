//
//  IAViewController.m
//  ChuckNorrisRater
//
//  Created by Marius Butuc on 13-07-07.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import "IAViewController.h"
#import "IAHTTPCommunication.h"

@interface IAViewController ()
{
    NSNumber *jokeID;
}
@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self retrieveRandomJokes:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retrieveRandomJokes:(id)sender
{
    IAHTTPCommunication *http = [[IAHTTPCommunication alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random"];
    [http retrieveURL:url successBlock:^(NSData *response)
     {
         NSError *error = nil;
         NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response
                                                              options:0
                                                                error:&error];
         if (!error)
         {
             NSArray *entries = data[@"value"];
             if (value && value[@"joke"])
             {
                 jokeID = value[@"id"];
                 [self.jokeLabel setText:firstEntry[@"joke"]];
             }
         }
     }];
    
}

@end

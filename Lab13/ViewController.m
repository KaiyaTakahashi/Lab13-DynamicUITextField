//
//  ViewController.m
//  Lab13
//
//  Created by Kaiya Takahashi on 2022-09-14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self textField] setDelegate:self];
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = textField.text;

    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:text];

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(red)" options:kNilOptions error:nil];

    NSRange rangee = NSMakeRange(0 ,text.length);

    [regex enumerateMatchesInString:text options:kNilOptions range:rangee usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {

        NSRange subStringRange = [result rangeAtIndex:0];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:subStringRange];
    }];

    textField.attributedText = mutableAttributedString;

    return YES;
}

@end

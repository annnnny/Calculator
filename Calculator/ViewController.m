//
//  ViewController.m
//  Calculator
//
//  Created by HsuAnny on 6/24/15.
//  Copyright (c) 2015 HsuAnny. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property UILabel *originalLabel;
@property int count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float screenWidth = self.view.frame.size.width;

    self.originalLabel = [[UILabel alloc] init];
    self.originalLabel.backgroundColor = [UIColor blackColor];
    self.originalLabel.frame = CGRectMake(0, 20, screenWidth, 202);
    self.originalLabel.text = @"0";
    self.originalLabel.font = [UIFont fontWithName:@"Helvetica" size:40];
    self.originalLabel.textColor = [UIColor whiteColor];
    self.originalLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.originalLabel];
    
    UIButton *historyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    historyButton.frame = CGRectMake(10, 30, 60, 30);
    historyButton.backgroundColor = [UIColor orangeColor];
    historyButton.layer.cornerRadius = 8; // this value vary as per your desire
    historyButton.clipsToBounds = YES;
    [historyButton setTitle:@"History" forState:UIControlStateNormal];
    [historyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [historyButton addTarget:self action:@selector(displayTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:historyButton];
    
    //First Row
    UIButton *buttonAC = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonAC.frame = CGRectMake(0, 202, screenWidth/4, 93);
    buttonAC.backgroundColor = [UIColor colorWithRed:175.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    buttonAC.tag = 10;
    buttonAC.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonAC setTitle:@"AC" forState:UIControlStateNormal];
    [buttonAC setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonAC layer] setBorderWidth:1.0f];
    [[buttonAC layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonAC addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAC];
    
    UIButton *buttonNeg = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonNeg.frame = CGRectMake(screenWidth/4, 202, screenWidth/4, 93);
    buttonNeg.backgroundColor = [UIColor colorWithRed:175.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    buttonNeg.tag = 11;
    buttonNeg.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonNeg setTitle:@"+/-" forState:UIControlStateNormal];
    [buttonNeg setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonNeg layer] setBorderWidth:1.0f];
    [[buttonNeg layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonNeg addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonNeg];
    
    UIButton *buttonPer = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonPer.frame = CGRectMake(2*screenWidth/4, 202, screenWidth/4, 93);
    buttonPer.backgroundColor = [UIColor colorWithRed:175.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    buttonPer.tag = 12;
    buttonPer.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonPer setTitle:@"%" forState:UIControlStateNormal];
    [buttonPer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonPer layer] setBorderWidth:1.0f];
    [[buttonPer layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonPer addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPer];
    
    UIButton *buttonPlus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonPlus.frame = CGRectMake(3*screenWidth/4, 202, screenWidth/4, 93);
    buttonPlus.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    buttonPlus.tag = 13;
    buttonPlus.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonPlus setTitle:@"+" forState:UIControlStateNormal];
    [buttonPlus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonPlus layer] setBorderWidth:1.0f];
    [[buttonPlus layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonPlus addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPlus];
    
    //Second Row
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonOne.tag = 1;
    buttonOne.frame = CGRectMake(0, 295, screenWidth/4, 93);
    buttonOne.backgroundColor = [UIColor grayColor];
    buttonOne.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonOne setTitle:@"1" forState:UIControlStateNormal];
    [buttonOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonOne layer] setBorderWidth:1.0f];
    [[buttonOne layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonOne addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOne];
    
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonTwo.frame = CGRectMake(screenWidth/4, 295, screenWidth/4, 93);
    buttonTwo.backgroundColor = [UIColor grayColor];
    buttonTwo.tag = 2;
    buttonTwo.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonTwo setTitle:@"2" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonTwo layer] setBorderWidth:1.0f];
    [[buttonTwo layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonTwo addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTwo];
    
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonThree.frame = CGRectMake(2*screenWidth/4, 295, screenWidth/4, 93);
    buttonThree.backgroundColor = [UIColor grayColor];
    buttonThree.tag = 3;
    buttonThree.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonThree setTitle:@"3" forState:UIControlStateNormal];
    [buttonThree setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonThree layer] setBorderWidth:1.0f];
    [[buttonThree layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonThree addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonThree];
    
    UIButton *buttonMinus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonMinus.frame = CGRectMake(3*screenWidth/4, 295, screenWidth/4, 93);
    buttonMinus.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    buttonMinus.tag = 14;
    buttonMinus.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonMinus setTitle:@"-" forState:UIControlStateNormal];
    [buttonMinus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonMinus layer] setBorderWidth:1.0f];
    [[buttonMinus layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonMinus addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonMinus];
    
    // Third row
    UIButton *buttonFour = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonFour.frame = CGRectMake(0 , 388, screenWidth/4, 93);
    buttonFour.backgroundColor = [UIColor grayColor];
    buttonFour.tag = 4;
    buttonFour.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonFour setTitle:@"4" forState:UIControlStateNormal];
    [buttonFour setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonFour layer] setBorderWidth:1.0f];
    [[buttonFour layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonFour addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFour];
    
    UIButton *buttonFive = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonFive.frame = CGRectMake(screenWidth/4, 388, screenWidth/4, 93);
    buttonFive.backgroundColor = [UIColor grayColor];
    buttonFive.tag = 5;
    buttonFive.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonFive setTitle:@"5" forState:UIControlStateNormal];
    [buttonFive setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonFive layer] setBorderWidth:1.0f];
    [[buttonFive layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonFive addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFive];
    
    UIButton *buttonSix = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSix.frame = CGRectMake(2*screenWidth/4, 388, screenWidth/4, 93);
    buttonSix.backgroundColor = [UIColor grayColor];
    buttonSix.tag = 6;
    buttonSix.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonSix setTitle:@"6" forState:UIControlStateNormal];
    [buttonSix setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonSix layer] setBorderWidth:1.0f];
    [[buttonSix layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonSix addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSix];
    
    UIButton *buttonMul = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonMul.frame = CGRectMake(3*screenWidth/4, 388, screenWidth/4, 93);
    buttonMul.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    buttonMul.tag = 15;
    buttonMul.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonMul setTitle:@"x" forState:UIControlStateNormal];
    [buttonMul setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonMul layer] setBorderWidth:1.0f];
    [[buttonMul layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonMul addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonMul];
    
    // Fourth row
    UIButton *buttonSeven = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSeven.frame = CGRectMake(0 , 481, screenWidth/4, 93);
    buttonSeven.backgroundColor = [UIColor grayColor];
    buttonSeven.tag = 7;
    buttonSeven.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonSeven setTitle:@"7" forState:UIControlStateNormal];
    [buttonSeven setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonSeven layer] setBorderWidth:1.0f];
    [[buttonSeven layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonSeven addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSeven];
    
    UIButton *buttonEight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonEight.frame = CGRectMake(screenWidth/4, 481, screenWidth/4, 93);
    buttonEight.backgroundColor = [UIColor grayColor];
    buttonEight.tag = 8;
    buttonEight.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonEight setTitle:@"8" forState:UIControlStateNormal];
    [buttonEight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonEight layer] setBorderWidth:1.0f];
    [[buttonEight layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonEight addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonEight];
    
    UIButton *buttonNine = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonNine.frame = CGRectMake(2*screenWidth/4, 481, screenWidth/4, 93);
    buttonNine.backgroundColor = [UIColor grayColor];
    buttonNine.tag = 9;
    buttonNine.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonNine setTitle:@"9" forState:UIControlStateNormal];
    [buttonNine setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonNine layer] setBorderWidth:1.0f];
    [[buttonNine layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonNine addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonNine];
    
    UIButton *buttonDiv = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonDiv.frame = CGRectMake(3*screenWidth/4, 481, screenWidth/4, 93);
    buttonDiv.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    buttonDiv.tag = 16;
    buttonDiv.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonDiv setTitle:@"÷" forState:UIControlStateNormal];
    [buttonDiv setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonDiv layer] setBorderWidth:1.0f];
    [[buttonDiv layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonDiv addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDiv];
    
    // Fifth row
    UIButton *buttonZero = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonZero.frame = CGRectMake(0, 574, screenWidth/2, 93);
    buttonZero.backgroundColor = [UIColor grayColor];
    buttonZero.tag = 0;
    buttonZero.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonZero setTitle:@"0" forState:UIControlStateNormal];
    [buttonZero setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonZero layer] setBorderWidth:1.0f];
    [[buttonZero layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonZero addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonZero];
    
    UIButton *buttonPoint = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonPoint.frame = CGRectMake(2*screenWidth/4, 574, screenWidth/4, 93);
    buttonPoint.backgroundColor = [UIColor grayColor];
    buttonPoint.tag = 17;
    buttonPoint.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonPoint setTitle:@"." forState:UIControlStateNormal];
    [buttonPoint setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[buttonPoint layer] setBorderWidth:1.0f];
    [[buttonPoint layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonPoint addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPoint];
    
    UIButton *buttonEq = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonEq.frame = CGRectMake(3*screenWidth/4, 574, screenWidth/4, 93);
    buttonEq.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    buttonEq.tag = 18;
    buttonEq.titleLabel.font = [UIFont systemFontOfSize:25.0];
    [buttonEq setTitle:@"=" forState:UIControlStateNormal];
    [buttonEq setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonEq layer] setBorderWidth:1.0f];
    [[buttonEq layer] setBorderColor:[UIColor whiteColor].CGColor];
    [buttonEq addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonEq];
    
    self.count = 0;
    resultArray = [[NSMutableArray alloc] init];
    
    historyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    historyTableView.delegate = self;
    historyTableView.dataSource = self;
    historyTableView.hidden = 1;
    [self.view addSubview:historyTableView];
    
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(15, self.view.frame.size.height - 45, 70, 35);
    backButton.backgroundColor = [UIColor lightGrayColor];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 8; // this value vary as per your desire
    backButton.clipsToBounds = YES;
    backButton.hidden = 1;
    [backButton addTarget:self action:@selector(removeTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
} // viewDidLoad()

-(void)buttonClick:(id)sender{

   float result;
    
   self.count++;
   // 0 only dissapear if it's the first click
   if (self.count == 1)
       self.originalLabel.text = @"";
    
   UIButton *btn = (UIButton*)sender;
   // NSLog(@"%i",(int)btn.tag);
    
    switch (btn.tag) {
        case 0:
            self.originalLabel.text = [NSString stringWithFormat:@"%@0",self.originalLabel.text];
            break;
            
        case 1:
            self.originalLabel.text = [NSString stringWithFormat:@"%@1",self.originalLabel.text];
            break;
        
        case 2:
            self.originalLabel.text = [NSString stringWithFormat:@"%@2",self.originalLabel.text];
            break;
            
        case 3:
            self.originalLabel.text = [NSString stringWithFormat:@"%@3",self.originalLabel.text];
            break;
            
        case 4:
            self.originalLabel.text = [NSString stringWithFormat:@"%@4",self.originalLabel.text];
            break;
            
        case 5:
            self.originalLabel.text = [NSString stringWithFormat:@"%@5",self.originalLabel.text];
            break;
            
        case 6:
            self.originalLabel.text = [NSString stringWithFormat:@"%@6",self.originalLabel.text];
            break;
            
        case 7:
            self.originalLabel.text = [NSString stringWithFormat:@"%@7",self.originalLabel.text];
            break;
    
        case 8:
            self.originalLabel.text = [NSString stringWithFormat:@"%@8",self.originalLabel.text];
            break;
            
        case 9:
            self.originalLabel.text = [NSString stringWithFormat:@"%@9",self.originalLabel.text];
            break;
        
        case 10:
            self.originalLabel.text = @"0";
            self.count = 0;
            break;
    
        case 11:
            // Negation
            break;
            
        case 12:
            NSLog(@"%f", (double)[self.originalLabel.text doubleValue]/100);
            result = [self.originalLabel.text doubleValue]/100;
            self.originalLabel.text = [NSString stringWithFormat:@"%f", result];
            break;
        
        case 13:
            if ([self.originalLabel.text hasSuffix:@"+"] || [self.originalLabel.text hasSuffix:@"-"] || [self.originalLabel.text hasSuffix:@"x"] || [self.originalLabel.text hasSuffix:@"/"])
                self.originalLabel.text = [self.originalLabel.text substringToIndex:[self.originalLabel.text length] - 1];
            self.originalLabel.text = [NSString stringWithFormat:@"%@+",self.originalLabel.text];
            break;
            
        case 14:
            if ([self.originalLabel.text hasSuffix:@"+"] || [self.originalLabel.text hasSuffix:@"-"] || [self.originalLabel.text hasSuffix:@"x"] || [self.originalLabel.text hasSuffix:@"/"])
                self.originalLabel.text = [self.originalLabel.text substringToIndex:[self.originalLabel.text length] - 1];
            self.originalLabel.text = [NSString stringWithFormat:@"%@-",self.originalLabel.text];
            break;
    
        case 15:
            if ([self.originalLabel.text hasSuffix:@"+"] || [self.originalLabel.text hasSuffix:@"-"] || [self.originalLabel.text hasSuffix:@"x"] || [self.originalLabel.text hasSuffix:@"/"])
                self.originalLabel.text = [self.originalLabel.text substringToIndex:[self.originalLabel.text length] - 1];
            self.originalLabel.text = [NSString stringWithFormat:@"%@x",self.originalLabel.text];
            break;
        
        case 16:
            if ([self.originalLabel.text hasSuffix:@"+"] || [self.originalLabel.text hasSuffix:@"-"] || [self.originalLabel.text hasSuffix:@"x"] || [self.originalLabel.text hasSuffix:@"/"])
                self.originalLabel.text = [self.originalLabel.text substringToIndex:[self.originalLabel.text length] - 1];
            self.originalLabel.text = [NSString stringWithFormat:@"%@/",self.originalLabel.text];
            break;
        
        case 17:
            if ([self.originalLabel.text hasSuffix:@"."])
                self.originalLabel.text = [self.originalLabel.text substringToIndex:[self.originalLabel.text length] - 1];
            self.originalLabel.text = [NSString stringWithFormat:@"%@.",self.originalLabel.text];
            break;
            
        default:
        {
            // Equal
            calcModel *mycalcModel = [[calcModel alloc] init];
            mycalcModel.delegate = self;
            result = [mycalcModel calculate:self.originalLabel.text];
            self.originalLabel.text = [[NSNumber numberWithFloat:result] stringValue];
            
            // Stored in resultArray for history TableView
            [resultArray addObject:[NSNumber numberWithFloat:(float)result]];
        
            [historyTableView reloadData];
            break;
        } // default
    } // switch()
} // buttonClick()

-(void) displayTable {
    historyTableView.hidden = 0;
    backButton.hidden = 0;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return [resultArray count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat) tableView:(UITableView *)tableView widthForHeaderInSection:(NSInteger)section{
    return self.view.frame.size.width;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width - 30, 35)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width - 30, 35)];
    headerLabel.text = @"Results History";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    
    headerLabel.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:headerLabel];
    
    return headerView;
}

// indexPath parameter contains the row number (as well as the section number) of the table row
- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *historyTableIdentifier = @"historyTableCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:historyTableIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:historyTableIdentifier];
    
    NSString *stringForCell;
    stringForCell= [[resultArray objectAtIndex:indexPath.row] stringValue];
    
    cell.textLabel.text = stringForCell;
    return cell;
}

-(void) removeTable {
    backButton.hidden = 1;
    historyTableView.hidden = 1;
}

-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

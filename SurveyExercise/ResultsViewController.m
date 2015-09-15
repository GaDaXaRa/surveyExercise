//
//  ViewController.m
//  SurveyExercise
//
//  Created by Miguel Santiago Rodríguez on 15/9/15.
//  Copyright (c) 2015 Miguel Santiago Rodríguez. All rights reserved.
//

#import "ResultsViewController.h"
#import "NotificationsKeys.h"

@interface ResultsViewController ()

@property (strong, nonatomic) UILabel *answersOfFirstAnswer;
@property (strong, nonatomic) UILabel *answersOfSecondAnswer;
@property (strong, nonatomic) UILabel *answersOfThirdAnswer;

@property (assign, nonatomic) NSUInteger answersOfFirst;
@property (assign, nonatomic) NSUInteger answersOfSecond;
@property (assign, nonatomic) NSUInteger answersOfThird;

@end

@implementation ResultsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self observeNotifications];
        self.answersOfFirst = 0;
        self.answersOfSecond = 0;
        self.answersOfThird = 0;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildLabels];
}

- (void)observeNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRecieveNotification:) name:didAnswerNotification object:nil];
}

- (void)didRecieveNotification:(NSNotification *)notification {
    NSUInteger questionNumber = [notification.userInfo[questionKey] integerValue];
    
    switch (questionNumber) {
        case 0:
            self.answersOfFirst ++;
            break;
        case 1:
            self.answersOfSecond ++;
            break;
        case 2:
            self.answersOfThird ++;
            break;
        default:
            break;
    }
    
    [self drawNumberOfAnswers];
}

- (void)buildLabels {
    self.answersOfFirstAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 100, 200, 40)];
    self.answersOfSecondAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 200, 200, 40)];
    self.answersOfThirdAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 300, 200, 40)];
    
    [self.view addSubview:self.answersOfFirstAnswer];
    [self.view addSubview:self.answersOfSecondAnswer];
    [self.view addSubview:self.answersOfThirdAnswer];
    [self drawNumberOfAnswers];
}

- (void)drawNumberOfAnswers {
    self.answersOfFirstAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfFirst];
    self.answersOfSecondAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfSecond];
    self.answersOfThirdAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfThird];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

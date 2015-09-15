//
//  QuestionsViewController.m
//  SurveyExercise
//
//  Created by Miguel Santiago Rodríguez on 15/9/15.
//  Copyright (c) 2015 Miguel Santiago Rodríguez. All rights reserved.
//

#import "QuestionsViewController.h"

static NSUInteger const padding = 16;

@interface QuestionsViewController ()

@property (strong, nonatomic) UISwitch *question1Switch;
@property (strong, nonatomic) UISwitch *question2Switch;
@property (strong, nonatomic) UISwitch *question3Switch;

@property (strong, nonatomic) UILabel *question1Label;
@property (strong, nonatomic) UILabel *question2Label;
@property (strong, nonatomic) UILabel *question3Label;

@property (strong, nonatomic) SurveyDatasource *datasource;

@end

@implementation QuestionsViewController

- (instancetype)initWithDataSource:(SurveyDatasource *)datasource {
    self = [super init];
    if (self) {
        _datasource = datasource;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildQuestions];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchQuestionData];
}

- (void)fetchQuestionData {
    NSUInteger questionNumber = [self.navigationController.viewControllers indexOfObject:self];
    
    NSDictionary *questions = [self.datasource fetchSurvey];
    NSArray *questionsArray = questions[@"preguntas"];
    NSDictionary *currentQuestion = [questionsArray objectAtIndex:questionNumber];
    [self drawQuestionsWithDictionary:currentQuestion];
}

- (void)drawQuestionsWithDictionary:(NSDictionary *)questionDictionary {
    self.navigationItem.title = questionDictionary[@"pregunta"];
    NSArray *answers = questionDictionary[@"respuestas"];
    self.question1Label.text = answers[0];
    self.question2Label.text = answers[1];
    self.question3Label.text = answers[2];
}

- (void)buildQuestions {
    [self buildQuestion1];
    [self buildQuestion2];
    [self buildQuestion3];
}

- (void)buildQuestion1 {
    UIView *question1View = [[UIView alloc] initWithFrame:CGRectMake(padding, 100, self.view.frame.size.width - 2 * padding, 40)];
    self.question1Switch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [question1View addSubview:self.question1Switch];
    
    CGFloat label1X = self.question1Switch.frame.origin.x + self.question1Switch.frame.size.width + padding;
    self.question1Label = [[UILabel alloc] initWithFrame:CGRectMake(label1X, 0, question1View.frame.size.width - self.question1Switch.frame.size.width - padding, self.question1Switch.frame.size.height)];
    self.question1Label.text = @"Pregunta";
    [question1View addSubview:self.question1Label];
    
    [self.view addSubview:question1View];
}

- (void)buildQuestion2 {
    UIView *question2View = [[UIView alloc] initWithFrame:CGRectMake(padding, 200, self.view.frame.size.width - 2 * padding, 40)];
    self.question2Switch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [question2View addSubview:self.question2Switch];
    
    self.question2Label = [[UILabel alloc] initWithFrame:CGRectMake(self.question2Switch.frame.origin.x + self.question2Switch.frame.size.width + padding, 0, question2View.frame.size.width - self.question2Switch.frame.size.width - padding, self.question2Switch.frame.size.height)];
    self.question2Label.text = @"Pregunta";
    [question2View addSubview:self.question2Label];
    
    [self.view addSubview:question2View];
}

- (void)buildQuestion3 {
    UIView *question3View = [[UIView alloc] initWithFrame:CGRectMake(padding, 300, self.view.frame.size.width - 2 * padding, 40)];
    self.question3Switch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [question3View addSubview:self.question3Switch];
    
    self.question3Label = [[UILabel alloc] initWithFrame:CGRectMake(self.question3Switch.frame.origin.x + self.question3Switch.frame.size.width + padding, 0, question3View.frame.size.width - self.question3Switch.frame.size.width - padding, self.question3Switch.frame.size.height)];
    self.question3Label.text = @"Pregunta";
    [question3View addSubview:self.question3Label];
    
    [self.view addSubview:question3View];
}

@end

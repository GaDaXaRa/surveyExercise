//
//  QuestionsViewController.h
//  SurveyExercise
//
//  Created by Miguel Santiago Rodríguez on 15/9/15.
//  Copyright (c) 2015 Miguel Santiago Rodríguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyDatasource.h"

@interface QuestionsViewController : UIViewController

- (instancetype)initWithDataSource:(SurveyDatasource *)datasource;

@end

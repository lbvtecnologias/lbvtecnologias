import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/Animation_Gesture/page_dragger.dart';
import 'package:pesquisa_cientifica/Animation_Gesture/page_reveal.dart';
import 'package:pesquisa_cientifica/UI/pager_indicator.dart';
import 'package:pesquisa_cientifica/UI/pages.dart';
import 'package:pesquisa_cientifica/home.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FonoCount - Apresentação',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {

  @override
  _OnBoardingPageState createState() => new _OnBoardingPageState();
}


class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin {

   StreamController<SlideUpdate> slideUpdateStream;
   AnimatedPageDragger animatedPageDragger;

   int activeIndex = 0 ;
   SlideDirection slideDirection = SlideDirection.none;
   int nextPageIndex = 0 ;
   double slidePercent= 0.0;

  _OnBoardingPageState(){
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event){
      setState(() {
        if( event.updateType == UpdateType.dragging){
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if( slideDirection == SlideDirection.leftToRight ){
              nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft){
              nextPageIndex = activeIndex + 1;
          } else{
              nextPageIndex = activeIndex;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Etapa1Page(title: 'FonoCount - Etapa 1',)));
          }
        } else if( event.updateType == UpdateType.doneDragging){
          if(slidePercent > 0.5){

            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

          } else{
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        }
        else if( event.updateType == UpdateType.animating){
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        }

        else if (event.updateType == UpdateType.doneAnimating){
          activeIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new Page(
            viewModel: pages[activeIndex],
            percentVisible: 1.0 ,
          ),
          new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[nextPageIndex],
              percentVisible: slidePercent ,
            ),
          ),
          new PagerIndicator(
              viewModel: new PagerIndicatorViewModel(
                  pages,
                  activeIndex,
                  slideDirection,
                  slidePercent,
              ),
          ),
          new PageDragger(
            canDragLeftToRight: activeIndex > 0 ,
            canDragRightToLeft: activeIndex < pages.length - 1 ,
            slideUpdateStream: this.slideUpdateStream,
          )
        ],
      ),
    );
  }
}

Strategy Design Pattern
=
Intent
-
If there is a family of algorithms and they are encapsulated and they are interchangeable the strategy algorithm is needed when the client want to use them all. It captures the abstraction in an interface and buries implementation details in derived classes.

Use the Strategy pattern when
-
There is a family of algorithms encaplulated and the client needs to make them interchangeable.

Discuss
-
The Strategy pattern defines a set of algorithms that are interchangeable.Let us think about the transportation system. We can use the bus, the truck or the plane. They can be chosen by the user or they are interchangeable. These systems are used in defferent situations. They are interchanged in the case of distance, time or cost, etc.
![car picture](https://sourcemaking.com/files/v2/content/patterns/Strategy_example1.svg Example via Car)

Structure
-
The interface entity could represent an abstract base class or the method signature expectations by the client .IN former case it represents dynamic polimorphism. Latter cases it represents static polimorphism.
![structure picture](https://sourcemaking.com/files/v2/content/patterns/Strategy_.svg Structure Picture)

* Client
* needs a colaborator.
* context-
* The desired interface the client will use
* Interface-
* The interface that ebables the design pattern and makes interchangeable the similar algorithm containing methods.
* ImplementatinOne-
* Contains one similar algorithm based method .
* ImplementationTwo-
* Contains other similar algorithm based method .

Rules of thumb
-
* It is similar to Template Method except in its granuarity.
* State pattern is similar to Strategy except in its intent.
* Strategy lets you to change the internal structure of an object. But decorator lets you change the skin.

Example with a source code
-
    #include<bits/stdc++.h>
    using namespace std ; 

    class Strategy;

    class TestBed{
      public:
        enum StrategyType{
            Dummy, Left, Right, Center
        };

        TestBed(){
            strategy_ = NULL;
        }

        void setStrategy(int type, int width);
        void doIt();
      
      private:
        Strategy *strategy_;
    };

    class Strategy{
      public:
        Strategy(int width): width_(width){}

        void format(){
            char line[80], word[30];
            ifstream inFile("quote.txt", ios::in);
            line[0] = '\0';

            inFile >> word;
            strcat(line, word);
            while (inFile >> word){
                if (strlen(line) + strlen(word) + 1 > width_)
                  justify(line);
                else
                  strcat(line, " ");
                strcat(line, word);
            }
            justify(line);
        }

      protected:
        int width_;

      private:
        virtual void justify(char *line) = 0;
    };

    class LeftStrategy: public Strategy{
      public:
        LeftStrategy(int width): Strategy(width){}

      private:
         /* virtual */void justify(char *line){
            cout << line << endl;
            line[0] = '\0';
        }
    };

    class RightStrategy: public Strategy{
      public:
        RightStrategy(int width): Strategy(width){}

      private:
         /* virtual */void justify(char *line){
            char buf[80];
            int offset = width_ - strlen(line);
            memset(buf, ' ', 80);
            strcpy(&(buf[offset]), line);
            cout << buf << endl;
            line[0] = '\0';
        }
    };

    class CenterStrategy: public Strategy{
      public:
        CenterStrategy(int width): Strategy(width){}

      private:
         /* virtual */void justify(char *line){
            char buf[80];
            int offset = (width_ - strlen(line)) / 2;
            memset(buf, ' ', 80);
            strcpy(&(buf[offset]), line);
            cout << buf << endl;
            line[0] = '\0';
        }
    };

    void TestBed::setStrategy(int type, int width){
      delete strategy_;
      if (type == Left)
        strategy_ = new LeftStrategy(width);
      else if (type == Right)
        strategy_ = new RightStrategy(width);
      else if (type == Center)
        strategy_ = new CenterStrategy(width);
    }

    void TestBed::doIt(){
      strategy_->format();
    }

    int main(){
      TestBed test;
      int answer, width;
      cout << "Exit(0) Left(1) Right(2) Center(3): ";
      cin >> answer;

      while (answer){
        cout << "Width: ";
        cin >> width;
        test.setStrategy(answer, width);
        test.doIt();
        cout << "Exit(0) Left(1) Right(2) Center(3): ";
        cin >> answer;
      }
      return 0;
    }

Output for the above code is - 

    Exit(0) Left(1) Right(2) Center(3): 2
    Width: 75
    Exit(0) Left(1) Right(2) Center(3): 3
    Width: 75

<sub>The source is collected from [this website](https://sourcemaking.com/design_patterns/strategy/cpp/1) as the code is perfect to understand and very easy</sub>
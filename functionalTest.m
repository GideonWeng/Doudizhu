classdef functionalTest < matlab.uitest.TestCase    
    methods (Test)
        function Test1(testCase)
            import matlab.unittest.TestCase
            import matlab.unittest.constraints.Throws

            % Create instances of 'player'
            player_0 = player;
            player_1 = player;
            player_2 = player;

            % Create instances of 'pokerGameUI'
            % TODO: UI background
            player_0_UI = pokerGameUI;
            player_0.currUI = player_0_UI;
            player_0.currUI.currPlayer = player_0;

            player_1_UI = pokerGameUI;
            player_1.currUI = player_1_UI;
            player_1.currUI.currPlayer = player_1;

            player_2_UI = pokerGameUI;
            player_2.currUI = player_2_UI;
            player_2.currUI.currPlayer = player_2;

            % player_0.currUI.currPlayer = player_0;
            player_0.currUI.player_1 = player_1;
            player_0.currUI.player_2 = player_2;

            % player_1.currUI.currPlayer = player_1;
            player_1.currUI.player_1 = player_0;
            player_1.currUI.player_2 = player_2;

            % player_2.currUI.currPlayer = player_2;
            player_2.currUI.player_1 = player_0;
            player_2.currUI.player_2 = player_1;

            % Create the instance of pokerRule
            rule = pokerRule;

            % Create instance of 'gameEngine'
            ge = gameEngine_Test1;
            ge.bgm();
            ge.player_0 = player_0;
            ge.player_1 = player_1;
            ge.player_2 = player_2;
            ge.rule = rule;

            rule.gameEngine = ge;

            % set gameEngine to different UIs
            player_0.currUI.gameEngine = ge;
            player_1.currUI.gameEngine = ge;
            player_2.currUI.gameEngine = ge;
            
            % START TEST
            % ready
            testCase.press(player_0_UI.ReadyButton);
            testCase.press(player_1_UI.ReadyButton);
            testCase.press(player_2_UI.ReadyButton);   
            
            % round 1
            [x,y] = ge.calcPosition(1,player_1);
            testCase.press(player_1.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(2,player_1);
            testCase.press(player_1.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(3,player_1);
            testCase.press(player_1.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(4,player_1);
            testCase.press(player_1.currUI.UIFigure,[x,y]);
            testCase.press(player_1_UI.ShotButton);
            
            [x,y] = ge.calcPosition(3,player_2);
            testCase.press(player_2.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(6,player_2);
            testCase.press(player_2.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(7,player_2);
            testCase.press(player_2.currUI.UIFigure,[x,y]);
            [x,y] = ge.calcPosition(8,player_2);
            testCase.press(player_2.currUI.UIFigure,[x,y]);
            testCase.press(player_2_UI.ShotButton);
            
            testCase.press(player_0_UI.PassButton);
            testCase.press(player_1_UI.PassButton);

            % round 2
            n = [3,4,6,7,8,9,10,11];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            n = [9,10,11,12,13,14,15,16,17];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.verifyThat(@()testCase.press(player_0_UI.ShotButton),Throws(''));
            
            n = [10,11,12,13,14,15,16,17];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            testCase.press(player_2_UI.PassButton);
            
            % round 3
            n = [5,6,7,8,9];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            n = [8,9,10,11,12,13];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.verifyThat(@()testCase.press(player_1_UI.ShotButton),Throws(''));
            
            n = [8,9,10,11,12];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            testCase.press(player_2_UI.PassButton);
            testCase.press(player_0_UI.PassButton);
            
            % round 4
            n = [1,2,3,4,5,6];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            testCase.press(player_2_UI.PassButton);
            testCase.press(player_0_UI.PassButton);
            
            % round 5
            n = [1];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            n = [5];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            testCase.press(player_0_UI.PassButton);
            testCase.press(player_1_UI.PassButton);
            
            % round 6
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            testCase.press(player_0_UI.PassButton);
            
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            testCase.press(player_2_UI.PassButton);
            testCase.press(player_0_UI.PassButton);
            
            % round 7
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            testCase.verifyEqual(ge.winner,0);
        end
        
        function Test2(testCase)
            import matlab.unittest.TestCase
            import matlab.unittest.constraints.Throws

            % Create instances of 'player'
            player_0 = player;
            player_1 = player;
            player_2 = player;

            % Create instances of 'pokerGameUI'
            % TODO: UI background
            player_0_UI = pokerGameUI;
            player_0.currUI = player_0_UI;
            player_0.currUI.currPlayer = player_0;

            player_1_UI = pokerGameUI;
            player_1.currUI = player_1_UI;
            player_1.currUI.currPlayer = player_1;

            player_2_UI = pokerGameUI;
            player_2.currUI = player_2_UI;
            player_2.currUI.currPlayer = player_2;

            % player_0.currUI.currPlayer = player_0;
            player_0.currUI.player_1 = player_1;
            player_0.currUI.player_2 = player_2;

            % player_1.currUI.currPlayer = player_1;
            player_1.currUI.player_1 = player_0;
            player_1.currUI.player_2 = player_2;

            % player_2.currUI.currPlayer = player_2;
            player_2.currUI.player_1 = player_0;
            player_2.currUI.player_2 = player_1;

            % Create the instance of pokerRule
            rule = pokerRule;

            % Create instance of 'gameEngine'
            ge = gameEngine_Test2;
            ge.bgm();
            ge.player_0 = player_0;
            ge.player_1 = player_1;
            ge.player_2 = player_2;
            ge.rule = rule;

            rule.gameEngine = ge;

            % set gameEngine to different UIs
            player_0.currUI.gameEngine = ge;
            player_1.currUI.gameEngine = ge;
            player_2.currUI.gameEngine = ge;
            
            % START TEST
            % ready
            testCase.press(player_0_UI.ReadyButton);
            testCase.press(player_1_UI.ReadyButton);
            testCase.press(player_2_UI.ReadyButton);   
            
            % round 1
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            testCase.press(player_0_UI.PassButton);
            testCase.press(player_1_UI.PassButton);
            
            % round 2
            n = [1,2,3,4,5,7,8];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.verifyThat(@()testCase.press(player_2_UI.ShotButton),Throws(''));
            
            n = [1,2,3,4,5,6];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            testCase.press(player_0_UI.PassButton);
            
            n = [3,4,5,6];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            testCase.press(player_2_UI.PassButton);
            testCase.press(player_0_UI.PassButton);
            
            % round 3
            n = [3,4,5,6,7,8];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_1);
                testCase.press(player_1.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_1_UI.ShotButton);
            
            n = [1,2,3,4,5,6];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            n = [9,10,11,12];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            testCase.press(player_2_UI.PassButton);
            
            % round 4
            n = [1,2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            
            n = [2,3];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            n = [13,14];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            testCase.press(player_2_UI.PassButton);
            
            % round 5
            n = [2];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_0);
                testCase.press(player_0.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_0_UI.ShotButton);
            
            testCase.press(player_1_UI.PassButton);
            
            n = [1];
            for k = 1:length(n)
                [x,y] = ge.calcPosition(n(k),player_2);
                testCase.press(player_2.currUI.UIFigure,[x,y]);
            end
            testCase.press(player_2_UI.ShotButton);
            
            testCase.verifyEqual(ge.winner,1);
        end
    end
end


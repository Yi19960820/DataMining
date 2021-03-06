function bayesdegree  = dataset1_bayes( trainset, testset, DEGREE)
    trainlength = length(trainset.feature1);
    maxFeature1 = max(trainset.feature1);
    maxFeature2 = max(trainset.feature2);
    maxFeature3 = max(trainset.feature3);
    maxFeature4 = max(trainset.feature4);
    maxFeature5 = max(trainset.feature5);
    maxFeature6 = max(trainset.feature6);
    maxFeature7 = max(trainset.feature7);
    maxFeature8 = max(trainset.feature8);
    maxFeature9 = max(trainset.feature9);
    countFeature1 = zeros(maxFeature1, length(DEGREE));
    countFeature2 = zeros(maxFeature2, length(DEGREE));
    countFeature3 = zeros(maxFeature3, length(DEGREE));
    countFeature4 = zeros(maxFeature4, length(DEGREE));
    countFeature5 = zeros(maxFeature5, length(DEGREE));
    countFeature6 = zeros(maxFeature6, length(DEGREE));
    countFeature7 = zeros(maxFeature7, length(DEGREE));
    countFeature8 = zeros(maxFeature8, length(DEGREE));
    countFeature9 = zeros(maxFeature9, length(DEGREE));
    
    proofdegree = zeros(1, length(DEGREE));
    countError = 0;
    for i = 1:length(proofdegree)
        countLabel = 0;
        for j = 1: trainlength
            if trainset.label(j) == DEGREE(i)
                countLabel  = countLabel + 1; 
            end
        end
        proofdegree(i) = countLabel;
    end
    
    for i = 1:maxFeature1
        for j = 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature1(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature1(i,k) = countFeature1(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature2
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature2(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature2(i,k) = countFeature2(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature3
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature3(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature3(i,k) = countFeature3(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature4
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature4(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature4(i,k) = countFeature4(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature5
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature5(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature5(i,k) = countFeature5(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature6
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature6(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature6(i,k) = countFeature6(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature7
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature7(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature7(i,k) = countFeature7(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature8
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature8(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature8(i,k) = countFeature8(i,k) + 1;
                end
            end
        end
    end
    for i = 1:maxFeature9
        for j= 1:trainlength
            for k = 1:length(DEGREE)
                if trainset.feature9(j) == i && trainset.label(j) == DEGREE(k)
                    countFeature9(i,k) = countFeature9(i,k) + 1;
                end
            end
        end
    end
    
    testlength = length(testset.feature1);
    bayesdegree = zeros(testlength, 1);
    features = zeros(testlength, 9);
    countsame = zeros(testlength, 1);
    for i = 1: testlength
        features(i,1) = testset.feature1(i);
        features(i,2) = testset.feature2(i);
        features(i,3) = testset.feature3(i);
        features(i,4) = testset.feature4(i);
        features(i,5) = testset.feature5(i);
        features(i,6) = testset.feature6(i);
        features(i,7) = testset.feature7(i);
        features(i,8) = testset.feature8(i);
        features(i,9) = testset.feature9(i);
        
        pro = zeros(length(DEGREE), 9);
        
        for j = 1: trainlength
            for k = 1: length(DEGREE)
                if trainset.label(j) == DEGREE(k) && trainset.feature1(j) == features(i,1)
                    pro(k,1) = pro(k,1) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature2(j) == features(i,2)
                    pro(k,2) = pro(k,2) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature3(j) == features(i,3)
                    pro(k,3) = pro(k,3) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature4(j) == features(i,4)
                    pro(k,4) = pro(k,4) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature5(j) == features(i,5)
                    pro(k,5) = pro(k,5) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature6(j) == features(i,6)
                    pro(k,6) = pro(k,6) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature7(j) == features(i,7);
                    pro(k,7) = pro(k,7) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature8(j) == features(i,8)
                    pro(k,8) = pro(k,8) + 1;
                end
                if trainset.label(j) == DEGREE(k) && trainset.feature9(j) == features(i,9)
                    pro(k,9) = pro(k,9) + 1;
                end
            end
            if trainset.feature1(j) == features(i,1) && trainset.feature2(j) == features(i,2) && trainset.feature3(j) == features(i,3)...
                    && trainset.feature4(j) == features(i,4) && trainset.feature5(j) == features(i,5) && trainset.feature6(j) == features(i,6) ...
                    && trainset.feature7(j) == features(i,7) && trainset.feature8(j) == features(i,8) && trainset.feature9(j) == features(i,9)
                countsame(i) = countsame(i) + 1;
            end
        end
        guessprobability = zeros(length(DEGREE), 1);
        probability = prod(pro);
        for k = 1:length(DEGREE)
            guessprobability(k) = double((probability(k))/(countsame(i)*proofdegree(k)^8));
        end
        [~, degreeposititon] = max(guessprobability);
        bayesdegree(i) = DEGREE(degreeposititon);
        if bayesdegree(i) ~= testset.label(i)
            countError = countError + 1;
        end
    end
    
end


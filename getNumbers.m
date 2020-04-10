function numbers = getNumbers(filename)
    Img = imread(filename);
    [r,c] = size(Img);
    numbers((r/28)*(c/28)).zeros = zeros(28,28);
    numCnt = 1;
    for col = 1:28:c-1
        for row = 1:28:r-1
            temp = double(Img(row:row+27,col:col+27));
            numbers(numCnt).nums = temp>50;
            numCnt = numCnt + 1;
        end
    end
end
function segments = CS5320_line_segs2(ime,Hpts,min_len)
% CS5320_line_segs - extract line segments from Hough info
% On input:
%       ime (mxn array): edge image (e.g., output of edge)
%       Hpts (txr array): Hough points array (see Cs5320_Hough)
%       min_len (int): minimum segment length
% On output:
%       segments (struct vector): segment info
%       (s).pts (kx2 array): row,col points in segment
%       (s).rho (int): rho parameter of line
%       (s).theta (float): theta parameter of line
%       (s).endpt1 (1x2 vector): one endpt of segment
%       (s).endpt2 (1x2 vector): other endpt of segment
% Call:
%       As = CS5320_line_segs(A,HApts,20);
% Author:
%       Shantnu Kakkar
%       UU
%       Spring 2016
%
segments = [];
[nr,nc] = size(ime);
[rSize,t] = size(Hpts);
mid = ceil((rSize-1)/2);
segments = [];
% segments.pts = [];
% segments.rho = [];
% segments.theta = [];
% segments.endpt1 = [];
% segments.endpt2 = [];
index = 0;

for rhoIndex = 1:rSize
    for thetaIndex = 1:t
        k = size(Hpts(rhoIndex,thetaIndex).pts,1);
        if k>min_len        
            index = index + 1;
            segments(index).rho = rhoIndex-mid-1;
            segments(index).theta = thetaIndex;
            im = zeros(nr,nc);
            for point = 1:k
                point1 = Hpts(rhoIndex,thetaIndex).pts(point,1);
                point2 = Hpts(rhoIndex,thetaIndex).pts(point,2);
                im(point1,point2) = 1;
            end
             se = strel('line',20,20);
             imDilated = imdilate(im,ones(20,20));
             imEroded = imerode(imDilated,ones(18,18));
    
        end
    end
end
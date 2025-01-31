
function [t, N, Pos] = FTTSeedCrash(Y)
%function that find where is the origin of a FTT crash
%It finds the seed NaN inside of a 3D matrix Y
%Gives the number of NaNs at the starting point N
%Gives their 3D positions Pos
%Y has dimensions (t,NET,NWR)

t = min(find(sum(sum(isnan(Y),2),3)>0));


A = permute(Y(t,:,:),[2 3 1]);
N = sum(sum(isnan(A)));
[rw,col]=find(isnan(A));

Pos = [rw col];

if isempty(t)
    t = NaN; N = NaN; Pos = [NaN NaN];
end
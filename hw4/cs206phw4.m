clear;

% 1
result = ones(1,3);
hb = hilb(5);
invhb1 = invhilb(5);
result(1,1) = cond(hb);
condhb = cond(hb);
muti1 = invhb1 * hb;
n1 = norm(muti1 - eye(5));
result(1,2) = norm(muti1 - eye(5));
invhb2 = inv(hb);
muti2 = invhb2 * hb;
n2 = norm(muti2 - eye(5));
result(1,3) = norm(muti2 - eye(5));

%2 & 3
result = ones(30,4);
for n=1.0:1.0:30.0
    n = single(n); %2
    result(n,1)=n;
    disp(n)
    hb = hilb(n);
    result(n,2) = cond(hb);
    
    invhb1 = invhilb(n);
    result(n,3) = norm(invhb1 * hb - eye(n));

    invhb2 = inv(hb);
    result(n,4) = norm(invhb2 * hb - eye(n));
    result(n,5) = norm(hb * invhb2 - eye(n));
end
%4
result = ones(30,10);
t = ones(1000,3);

for n=1:1:30
    result(n,1)=n;
    imat = eye(n);
    for i=1:1:1000
        mat = rand(n);
        t(i,1) = cond(mat);
        invMat = inv(mat);
        t(i,2) = norm(mat * invMat - imat);
        t(i,3) = norm(invMat * mat - imat);
    end
    result(n,2:3:8)=mean(t);
    result(n,3:3:9)=min(t);
    result(n,4:3:10)=max(t);
end

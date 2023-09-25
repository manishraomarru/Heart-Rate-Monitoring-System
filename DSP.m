i=1
z=zeros(1,4000);
while(i<4001)
    z(i)=sig(1,i);
    i=i+1;
end
M=mean(z);
subplot(3,1,1)
z1=zeros(1,4000);
i=1;
while(i<4001)
    z1(i)=z(i)-M;
    i=i+1;
end
plot(z1)
%SVD
[U,S,V]=svd(z1);
i=1;
j=1;
while(i<4000)
    j=1;
   if(S(1)*(V(i+1,j)-V(i,j))>40)
        V(i,j)=0;
    end
    if(S(1)*(V(i,j)-V(i+1,j))>40)
        V(i,j)=0;
    end
    i=i+1;
end
i=1;
while(i<4000)
    j=1;
    if(S(1)*(V(i+1,j)-V(i,j))>40)
        V(i,j)=0;
    end
    if(S(1)*(V(i,j)-V(i+1,j))>40)
        V(i,j)=0;
    end
    i=i+1;
end
r=zeros(1,4000);
tr=transpose(V);
r=U*S*tr;
subplot(3,1,2);
plot(r)
%TEMPORAL DIFFERENCE
tem=zeros(1,3999);
j=1;
while(j<4000)
    tem(j)=r(j+1)-r(j);
    j=j+1;
end
%subplot(3,1,3);
plot(tem);
%Spectral Peak Tracking
j=1
yu=zeros(1,200);
while(j<201)
    yu(j)=r(j);
    if(yu(j)>120)
        j
        yu(j)
    end
    j=j+1;
end
plot(yu);
st=75;
diff=100;
i=st;
beats=0;
while(i<4000)
    j=-20;
    while(j<20)
        if(r(i+j)>40)
            beats=beats+1;
            j=20;
        end
        j=j+1;
    end
    i=i+diff;
end
plot(r);
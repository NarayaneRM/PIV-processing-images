function x=TurbulenceIntensity(uf,U)
    [lines,columns, length]=size(uf);
    for j=1:length
        for i=1:lines
            if(U(i,3)==0)
                Ix(i,1,j)=0;
            else
                Ix(i,1,j)=abs(uf(i,3,j)/U(i,3));
            end
            if(U(i,4)==0)
                Iy(i,1,j)=0;
            else
                Iy(i,1,j)=abs(uf(i,4,j)/U(i,4));
            end
        end
    end
    I=[uf(:,1,:),uf(:,2,:),Ix,Iy];
    x=I;
    return;
end
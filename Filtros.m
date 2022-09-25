Im=imread("leon.jfif");
[m,n,p]=size(Im);
Img=rgb2gray(Im);

subplot(3,2,1);
imshow(Img);
title("Imagen Original");

%proceso de imagen original en escala de grises 
ImB=double(Img);

ImBarrido=ImB;
ImBox=ImB;
ImGaus=ImB;
ImLaplace=ImB;

%Barrido
for r=2:m-1
 for c=2:n-1
 ImBarrido(r,c)=1/9*(ImB(r-1,c-1)+ImB(r-1,c)+ImB(r-1,c+1)+ImB(r,c-1)+ImB(r,c)+ImB(r,c+1)+ImB(r+1,c-1)+ImB(r+1,c)+ImB(r+1,c+1));
 end
end
%Conversion de imagen a entero para poder desplegarla
ImBarrido=uint8(ImBarrido);
subplot(3,2,2);
imshow(ImBarrido);
title("Filtro Barrido");


%Filtro Box
for f=3:m-2
 for c=3:n-2
    ImBox(f,c)=1/25*((ImB(f-2,c-2)*0)+(ImB(f-2,c-1)*0) + (ImB(f-2,c)*0) + (ImB(f-2,c+1)*0) + (ImB(f-2,c+2)*0) + ...
            (ImB(f-1,c-2)*0)+(ImB(f-1,c-1)) + (ImB(f-1,c)) + (ImB(f-1,c+1)) + (ImB(f-1,c+2)*0) +  ...
            (ImB(f,c-2)*0)+(ImB(f,c-1)) + (ImB(f,c)) + (ImB(f,c+1)) + (ImB(f,c+2)*0) + ...
            (ImB(f+1,c-2)*0)+(ImB(f+1,c-1)) +(ImB(f+1,c)) + (ImB(f+1,c+1)) + (ImB(f+1,c+2)*0)+ ...
            (ImB(f+2,c-2)*0)+(ImB(f+2,c-1)*0) + (ImB(f+2,c)*0) + (ImB(f+2,c+1)*0) + (ImB(f+2,c+2)*0)); 
 end
end
%Conversion de imagen a entero para poder desplegarla
ImBox=uint8(ImBox);
subplot(3,2,3);
imshow(ImBox);
title("Filtro Box");


%Filtro de Gaus
for f=3:m-2
    for c=3:n-2  
            ImGaus(f,c)=1/57*((ImB(f-2,c-2)*0)+(ImB(f-2,c-1)*1) + (ImB(f-2,c)*2) + (ImB(f-2,c+1)*1) + (ImB(f-2,c+2)*0) + ...
            (ImB(f-1,c-2)*1)+(ImB(f-1,c-1)*3) + (ImB(f-1,c)*5) + (ImB(f-1,c+1)*3) + (ImB(f-1,c+2)*1) +  ...
            (ImB(f,c-2)*2)+(ImB(f,c-1)*5) + (ImB(f,c)*9) + (ImB(f,c+1)*5) + (ImB(f,c+2)*2) + ...
            (ImB(f+1,c-2)*1)+(ImB(f+1,c-1)*3) +(ImB(f+1,c)*5) + (ImB(f+1,c+1)*3) + (ImB(f+1,c+2)*1)+ ...
            (ImB(f+2,c-2)*0)+(ImB(f+2,c-1)*1) + (ImB(f+2,c)*2) + (ImB(f+2,c+1)*1) + (ImB(f+2,c+2)*0)); 
    end
end
%Conversion de imagen a entero para poder desplegarla
ImGaus=uint8(ImGaus);
subplot(3,2,4);
imshow(ImGaus);
title("Filtro Gaus");
    


%Filtro Laplaciano
for f=3:m-2
    for c=3:n-2  
            ImLaplace(f,c)=((ImB(f-2,c-2)*0)+(ImB(f-2,c-1)*0) + (ImB(f-2,c)*-1) + (ImB(f-2,c+1)*0) + (ImB(f-2,c+2)*0) + ...
            (ImB(f-1,c-2)*0)+(ImB(f-1,c-1)*-1) + (ImB(f-1,c)*-2) + (ImB(f-1,c+1)*-1) + (ImB(f-1,c+2)*0) +  ...
            (ImB(f,c-2)*-1)+(ImB(f,c-1)*-2) + (ImB(f,c)*16) + (ImB(f,c+1)*-2) + (ImB(f,c+2)*-1) + ...
            (ImB(f+1,c-2)*0)+(ImB(f+1,c-1)*-1) +(ImB(f+1,c)*-2) + (ImB(f+1,c+1)*-1) + (ImB(f+1,c+2)*0)+ ...
            (ImB(f+2,c-2)*0)+(ImB(f+2,c-1)*0) + (ImB(f+2,c)*-1) + (ImB(f+2,c+1)*0) + (ImB(f+2,c+2)*0)); 
    end
end

ImLaplace=uint8(ImLaplace);
subplot(3,2,5);
imshow(ImLaplace);
title("Filtro Laplaceano");



function draw_circle(r,Mipie)
  

xlim([-25 25]);
 ylim([-25 25]);
 
    t = (0:0.2:10)'; % Time
    center = [0 0 0];
    radius = r;
    theta = t*(2*pi/t(end));
    points = center + radius*[cos(theta) sin(theta) zeros(size(theta))];

    point0 = transl(center);
    q00 = Mipie.ikine(point0,'q0',[-1 2 0],'mask', [1 1 0 0 0 0]);
    plot(Mipie, q00)

    for i=1:size(points)
        if i==1
            p1 = center;
            p2 = [points(i,1),points(i,2),0];
            T1 = transl(p1);
            T2 = transl(p2);
            CT = ctraj(T1,T2,3);
            q = Mipie.ikine(CT,'q0',q00, 'mask', [1 1 0 0 0 0]); 
            q00 = q(3,:);
            plot(Mipie, q)
        else
            p1 = [points(i-1,1),points(i-1,2),0];
            p2 = [points(i,1),points(i,2),0];
            T1 = transl(p1);
            T2 = transl(p2);
            CT = ctraj(T1,T2,3);
            q = Mipie.ikine(CT,'q0',q00, 'mask', [1 1 0 0 0 0]); 
            q00 = q(3,:);
            plot(Mipie, q)

            hold on
            x = [p1(1) ; p2(1) ];
            y = [p1(2) ; p2(2) ];
            plot(x,y,'LineWidth',2,'color','k')
        end
    end

end
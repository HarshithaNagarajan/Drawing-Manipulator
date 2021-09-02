clear all;
clc;
close all;


a1 = 15; a2 = 15; 
%  theta        kinematic: joint angle
%  d            kinematic: link offset
%  a            kinematic: link length
%  alpha        kinematic: link twist
Mipie = SerialLink([Link([0 0 0 0], 'modified');
                   Link([0 0 a1 0], 'modified');
                   Link([0 0 a2 0], 'modified')
                   ],'name', 'Mipie');
               
               
shape = 10;

while shape ~= 0

clc;
disp("Choose a shape that you would like Mipie to draw!");
disp("1. Square");
disp("2. Rectangle");
disp("3. Triangle");
disp("4. Diamond");
disp("5. Circle");
disp("0. Exit, please :)");
shape = input("Enter your choice:");


    switch shape
        case 1
            side = input("Enter the side length:");
    %         if side>= a1+a2
    %             disp("Oops! Length must be << 20")
    %             return
    %         end
            draw_square(side,Mipie);
        case 2
            l = input("Enter the length:");
            b = input("Enter the breadth:");
            draw_rectangle(l,b,Mipie);
        case 3
            s = input("Enter length:");
            draw_triangle(s, Mipie);
        case 4
            s = input("Enter length:");
            draw_diamond(s, Mipie);
        case 5
            rad = input("Enter radius:");
            draw_circle(rad, Mipie);
        case 0
            return  
        otherwise
            disp('Invalid choice! Try again.');
            pause(2);
    end

end




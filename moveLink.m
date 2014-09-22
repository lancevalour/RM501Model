function [ ] = moveLink(theta1,theta2,theta3,theta4,theta5)
%This function calculates the homogenious transformation matrices between
%different joints and plots the positions of joints and the end effecter in
%3-D coordinate frame.
    theta1=theta1*3.1415926/180;
    theta2=theta2*3.1415926/180;
    theta3=theta3*3.1415926/180;
    theta4=theta4*3.1415926/180;
    theta5=theta5*3.1415926/180;

    %Input the homogenious transformation matrices of 0T1, 1T2, 2T3, 3T4, 4T5
    %and ST0, 5TT

    %0T1
    zeroTone=[cos(theta1),-sin(theta1),0,0;
    sin(theta1),cos(theta1),0,0;
    0,0,1,0;
    0,0,0,1];

    %1T2
    oneTtwo=[cos(theta2),-sin(theta2),0,0;
        0,0,1,0;
        -sin(theta2),-cos(theta2),0,0;
        0,0,0,1];

    %2T3
    twoTthree=[cos(theta3),-sin(theta3),0,220;
        sin(theta3),cos(theta3),0,0;
        0,0,1,0;
        0,0,0,1];

    %3T4
    threeTfour=[cos(theta4),-sin(theta4),0,160;
        sin(theta4),cos(theta4),0,0;
        0,0,1,0;
        0,0,0,1];

    %4T5
    fourTfive=[cos(theta5),-sin(theta5),0,0;
        0,0,-1,0;
        sin(theta5),cos(theta5),0,0;
        0,0,0,1];

    %ST0
    STzero=[1,0,0,0;
        0,1,0,0;
        0,0,1,250;
        0,0,0,1];

    %5TT
    fiveTtool=[1,0,0,0;
        0,1,0,0;
        0,0,1,196.1;
        0,0,0,1];

    %Calulate the homogenious transfromation matrix of ST1, ST2, ST3, ST4,
    %ST5,STT via matrix multiplication

    %ST1
    ST1=STzero*zeroTone;
    ST2=ST1*oneTtwo;
    ST3=ST2*twoTthree;
    ST4=ST3*threeTfour;
    ST5=ST4*fourTfive;
    STT=ST5*fiveTtool;

    %Set the origin coordinates of each joints
    TP=[0,0,0,1]';
    fiveP=[0,0,0,1]';
    fourP=[0,0,0,1]';
    threeP=[0,0,0,1]';
    twoP=[0,0,0,1]';
    oneP=[0,0,0,1]';
    zeroP=[0,0,0,1]';
    originS=[0,0,0,1]';

    %Set the coordinates of end effector
    fiveP1=[20,0,30,1]';
    fiveP2=[-20,0,30,1]';
    fiveP11=[20,0,60,1]';
    fiveP22=[-20,0,60,1]';
    fiveP3=[0,0,30,1]';

    %Calculate the corresponding coordinates of each joints in the S frame
    SPT=STT*TP;
    SP5=ST5*fiveP;
    SP4=ST4*fourP;
    SP3=ST3*threeP;
    SP2=ST2*twoP;
    SP1=ST1*oneP;
    SP0=STzero*zeroP;

    SP51=ST5*fiveP1;
    SP52=ST5*fiveP2;
    SP511=ST5*fiveP11;
    SP522=ST5*fiveP22;
    SP53=ST5*fiveP3;

    %Connect joints with each other with links, and plot in 3D

    % figure(1),plot3([SP5(1),SPT(1)],[SP5(2),SPT(2)],[SP5(3),SPT(3)],'linewidth',3,'color','g');
    % 
    % axis([-500 500 -500 500 0 1000]);
    % hold on;

    %Draw the end effector
    scr=get(0,'ScreenSize');
    fg1=figure(1);
    fg2=figure(2);
    fg3=figure(3);
    set(fg1,'Position',[1, 2*scr(4)/3, scr(3)/3, scr(4)/3])
    set(fg2,'Position',[230+scr(4)/3, 2*scr(4)/3, scr(3)/3, scr(4)/3])
    set(fg3,'Position',[460+2*scr(4)/3, 2*scr(4)/3, scr(3)/3, scr(4)/3])
    
    figure(1),plot3([SP51(1),SP511(1)],[SP51(2),SP511(2)],[SP51(3),SP511(3)],'linewidth',3,'color','r');
    axis([-500 500 -500 500 0 1000]);
    title('3D Model');
    grid on;
    hold on;
    plot3([SP52(1),SP522(1)],[SP52(2),SP522(2)],[SP52(3),SP522(3)],'linewidth',3,'color','r');
    plot3([SP51(1),SP52(1)],[SP51(2),SP52(2)],[SP51(3),SP52(3)],'linewidth',3,'color','r');
    plot3([SP53(1),SP5(1)],[SP53(2),SP5(2)],[SP53(3),SP5(3)],'linewidth',3,'color','r');

    %Draw the links
    plot3([SP3(1),SP4(1)],[SP3(2),SP4(2)],[SP3(3),SP4(3)],'linewidth',6,'color','b');
    plot3([SP4(1),SP5(1)],[SP4(2),SP5(2)],[SP4(3),SP5(3)],'linewidth',6,'color','g');

    plot3([SP2(1),SP3(1)],[SP2(2),SP3(2)],[SP2(3),SP3(3)],'linewidth',6,'color','c');
    plot3([SP1(1),SP2(1)],[SP1(2),SP2(2)],[SP1(3),SP2(3)],'linewidth',6,'color','m');
    plot3([SP0(1),SP1(1)],[SP0(2),SP1(2)],[SP0(3),SP1(3)],'linewidth',6,'color','y');
    plot3([originS(1),SP0(1)],[originS(2),SP0(2)],[originS(3),SP0(3)],'linewidth',6,'color','k');
    plot3([0,0],[-100,100],[0,0],'linewidth',2,'color','m');
    plot3([100,-100],[0,0],[0,0],'linewidth',2,'color','m');

    hold off;

    figure(2),plot([SP51(1),SP511(1)],[SP51(3),SP511(3)],'linewidth',3,'color','r');
    axis([-500 500 -300 1000]);
    title('X-Z Projection Perspective');
    grid on;
    hold on;
    plot([SP52(1),SP522(1)],[SP52(3),SP522(3)],'linewidth',3,'color','r');
    plot([SP51(1),SP52(1)],[SP51(3),SP52(3)],'linewidth',3,'color','r');
    plot([SP53(1),SP5(1)],[SP53(3),SP5(3)],'linewidth',3,'color','r');

    %Draw the links
    plot([SP3(1),SP4(1)],[SP3(3),SP4(3)],'linewidth',6,'color','b');
    plot([SP2(1),SP3(1)],[SP2(3),SP3(3)],'linewidth',6,'color','c');
    plot([SP4(1),SP5(1)],[SP4(3),SP5(3)],'linewidth',6,'color','g');


    plot([SP1(1),SP2(1)],[SP1(3),SP2(3)],'linewidth',6,'color','m');
    plot([SP0(1),SP1(1)],[SP0(3),SP1(3)],'linewidth',6,'color','y');
    plot([originS(1),SP0(1)],[originS(3),SP0(3)],'linewidth',6,'color','k');
    plot([0,0],[0,0],'linewidth',2,'color','m');
    plot([100,-100],[0,0],'linewidth',2,'color','m');

    hold off;
    %numofFrame=uint8(theta1*100+1);
    %F(numofFrame)=getframe;

    % if (SP511(3)>SP5(3)&&SP51(3)>SP5(3)&&SP52(3)>SP5(3)

    if (SP53(3)<SP5(3))
        figure(3),
        plot([0,0],[-100,100],'linewidth',2,'color','m');
        axis([-500 500 -500 500]);
        title('X-Y Projection Perspective');
        grid on;
        hold on;
        plot([SP53(1),SP5(1)],[SP53(2),SP5(2)],'linewidth',3,'color','r');
        plot([SP51(1),SP52(1)],[SP51(2),SP52(2)],'linewidth',3,'color','r');
        plot([SP52(1),SP522(1)],[SP52(2),SP522(2)],'linewidth',3,'color','r');

        plot([SP51(1),SP511(1)],[SP51(2),SP511(2)],'linewidth',3,'color','r');
        plot([100,-100],[0,0],'linewidth',2,'color','m');
        plot([originS(1),SP0(1)],[originS(2),SP0(2)],'linewidth',6,'color','k');
        plot([SP0(1),SP1(1)],[SP0(2),SP1(2)],'linewidth',6,'color','y');
        plot([SP1(1),SP2(1)],[SP1(2),SP2(2)],'linewidth',6,'color','m');
        plot([SP2(1),SP3(1)],[SP2(2),SP3(2)],'linewidth',6,'color','c');
        plot([SP3(1),SP4(1)],[SP3(2),SP4(2)],'linewidth',6,'color','b');
        plot([SP4(1),SP5(1)],[SP4(2),SP5(2)],'linewidth',6,'color','g');

        hold off;
    else 
        figure(3),
        plot([0,0],[-100,100],'linewidth',2,'color','m');
        axis([-500 500 -500 500]);
        title('X-Y Projection Perspective');
        grid on;
        hold on;

        plot([100,-100],[0,0],'linewidth',2,'color','m');
        plot([originS(1),SP0(1)],[originS(2),SP0(2)],'linewidth',6,'color','k');
        plot([SP0(1),SP1(1)],[SP0(2),SP1(2)],'linewidth',6,'color','y');
        plot([SP1(1),SP2(1)],[SP1(2),SP2(2)],'linewidth',6,'color','m');
        plot([SP2(1),SP3(1)],[SP2(2),SP3(2)],'linewidth',6,'color','c');
        plot([SP3(1),SP4(1)],[SP3(2),SP4(2)],'linewidth',6,'color','b');
        plot([SP4(1),SP5(1)],[SP4(2),SP5(2)],'linewidth',6,'color','g');

        plot([SP53(1),SP5(1)],[SP53(2),SP5(2)],'linewidth',3,'color','r');
        plot([SP51(1),SP52(1)],[SP51(2),SP52(2)],'linewidth',3,'color','r');
        plot([SP52(1),SP522(1)],[SP52(2),SP522(2)],'linewidth',3,'color','r');

        plot([SP51(1),SP511(1)],[SP51(2),SP511(2)],'linewidth',3,'color','r');
        hold off;  
    end
end
%% Create a visualization of the components of research science
% As I see it, there are few concurrently synergistic and conflicting goals
% of research science.  These end goals include:
%
% * Data - Sharing and disseminating high pedigree data as output of the
% research process.
% * Software - Deploying versioned, reproducible software for data ingest,
% analytics, and visualization.
% * Publication - The standard end goal of research which I think 
% <www.authoera.com Authorea> 
% has the best solution for.
% * Teaching - New science eventually needs to integrate into cirricula and
% needs to be shared with the next generation workforce.
%
% This script makes a visualization to use documents discussing research
% science.


%% Circle 

c = [ 350 200; 550 200; 350 400; 550 400];
co = cbrewer('qual','Set1',4);

radius = 180;

fields = {'Software','Data','Teaching','Publication'};
verta = {'top','bottom','top','bottom'};% VerticalAlignment
horza = {'right','right','left','left'}; % HorizontalAlignment
for ii = 1 : 4
    xx = radius.* cosd( linspace( 0 , 360 )) + c(ii,2);
    yy = radius.* sind( linspace( 0 , 360 ))+ c(ii,1); 
    p = patch( xx,yy,co(ii,:));
    set(p ,'FaceAlpha',.5);
    
end

%%% Outline circles
hold on
for ii = 1 : 4
    xx = radius.* cosd( linspace( 0 , 360 )) + c(ii,2);
    yy = radius.* sind( linspace( 0 , 360 ))+ c(ii,1); 
    plot3( xx,yy,1000*ones(size(xx)), 'k-','LineWidth',3);
    text( c(ii,2),c(ii,1),1000, fields{ii},'Fontsize',20,...
        'VerticalAlignment',verta{ii},'HorizontalAlignment',horza{ii})
end
hold off


figure(gcf)
% axis off
set(gcf,'Color','w','Position',get( 0,'ScreenSize'));
axis square
axis off

ylim([100 800])
xlim([-50 650])

title('End Goals of Research Science','Fontsize',16) 
snapnow;
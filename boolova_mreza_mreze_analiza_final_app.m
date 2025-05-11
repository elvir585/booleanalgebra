
function boolova_mreza_mreze_analiza_final_app()
    % Finalna verzija MATLAB aplikacije za analizu mreža (GK, UK, TK, HK, BK)
    % Uključuje: unos funkcija, sjecišta, spajanja, Booleove tabele i prikaz mreža

    figure('Name','Analiza mreža kroz Booleovu algebru','NumberTitle','off','Position',[100 100 1200 700]);

    uicontrol('Style','text','Position',[20 650 300 30],'String','Unesite funkcije f(x) i g(x):','FontSize',12);
    uicontrol('Style','text','Position',[20 620 60 25],'String','f(x):','FontSize',10);
    fxEdit = uicontrol('Style','edit','Position',[80 620 150 25],'String','x.^2');
    uicontrol('Style','text','Position',[20 590 60 25],'String','g(x):','FontSize',10);
    gxEdit = uicontrol('Style','edit','Position',[80 590 150 25],'String','2*x+1');

    axesHandle = axes('Units','pixels','Position',[400 150 750 500]);
    grid on; hold on;

    uicontrol('Style','pushbutton','Position',[80 550 100 30],'String','Prikaži','Callback',@prikaziFunkcije);
    uicontrol('Style','pushbutton','Position',[80 510 100 30],'String','Booleova tabela','Callback',@prikaziTabelu);
    uicontrol('Style','pushbutton','Position',[80 470 100 30],'String','DNF/KNF','Callback',@prikaziLogiku);
    uicontrol('Style','pushbutton','Position',[80 430 100 30],'String','Prikaži mreže','Callback',@prikaziMreze);
    uicontrol('Style','pushbutton','Position',[80 390 100 30],'String','Sačuvaj','Callback',@sacuvajGraf);

    function prikaziFunkcije(~,~)
        fstr = get(fxEdit,'String');
        gstr = get(gxEdit,'String');
        f = str2func(['@(x)', fstr]);
        g = str2func(['@(x)', gstr]);
        x = linspace(-10,10,1000);
        y1 = f(x);
        y2 = g(x);
        cla(axesHandle);
        plot(axesHandle,x,y1,'b','LineWidth',2); hold on;
        plot(axesHandle,x,y2,'r','LineWidth',2);
        legend(axesHandle,'f(x)','g(x)');
        title(axesHandle,'Funkcije i njihova sjecišta');
        xlabel('x'); ylabel('y');
        idx = abs(y1 - y2) < 0.05;
        plot(axesHandle,x(idx),y1(idx),'ko','MarkerSize',6,'MarkerFaceColor','g');
    end

    function prikaziTabelu(~,~)
        figure('Name','Booleova algebra - Tabela');
        uit = uitable('Data',{
            0,0,0,0,1;
            0,1,1,0,1;
            1,0,1,0,0;
            1,1,1,1,0
        },'ColumnName',{'a','b','a or b','a and b','~a'},'Position',[20 20 400 100]);
    end

    function prikaziLogiku(~,~)
        msgbox({'DNF: (¬a ∧ b) ∨ (a ∧ ¬b) ∨ (a ∧ b)', ...
                'KNF: (a ∨ b) ∧ (¬a ∨ b) ∧ (a ∨ ¬b)'}, ...
                'Logičke forme');
    end

    function prikaziMreze(~,~)
        figure('Name','Tipovi mreža (GK, UK, TK, HK, BK)','NumberTitle','off');
        subplot(2,3,1); gplot([0 1; 1 0],[0 0; 1 1]); title('GK');
        subplot(2,3,2); gplot([0 1; 1 0],[0 0; 1 0]); title('UK');
        subplot(2,3,3); gplot([0 1; 1 1],[0 0; 1 1]); title('TK');
        subplot(2,3,4); gplot([0 1; 1 0],[0 0; 1 1]); title('HK');
        subplot(2,3,5); gplot([0 1; 1 0],[0 0; 1 1]); title('BK');
    end

    function sacuvajGraf(~,~)
        [file,path] = uiputfile('graf_izlaz.png','Sačuvaj graf');
        if ischar(file)
            exportgraphics(axesHandle,fullfile(path,file));
        end
    end
end

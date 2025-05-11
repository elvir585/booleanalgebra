function bool_mreza_analiza_app_extended
    % BOOLEOVA ALGEBRA I MREZE: GK, UK, TK, HK, BK + ANALIZA

    fig = uifigure('Name','Analiza Mreža i Booleove Algebre','Position',[100 100 900 600]);
    
    % Dropdown za odabir mreže
    dd = uidropdown(fig,...
        'Items',{'GK - Generalizovana mreža','UK - Unijska mreža','TK - Topološka mreža','HK - Horizontalno-vertikalna','BK - Booleova mreža'},...
        'Position',[50 530 300 30],...
        'ValueChangedFcn',@(dd,event) prikaziMrezu(dd.Value));
    
    % Textarea za prikaz DNF, KNF
    ta = uitextarea(fig,'Position',[50 300 400 200]);

    % Axes za prikaz grafa
    ax = uiaxes(fig,'Position',[500 250 350 300]);
    title(ax, 'Prikaz mreže');

    % Button za prikaz tablica istinitosti
    btnTablica = uibutton(fig,'Text','Prikaži Booleove Tablice',...
        'Position',[50 250 200 30],...
        'ButtonPushedFcn',@(btn,event) prikaziTablice(ta));
    
    % Button za izlazne podatke
    btnExport = uibutton(fig,'Text','Sačuvaj PDF',...
        'Position',[300 250 120 30],...
        'ButtonPushedFcn',@(btn,event) exportujPDF());
    
    % Funkcija za prikaz mreža
    function prikaziMrezu(vrsta)
        cla(ax);
        switch vrsta
            case 'GK - Generalizovana mreža'
                grafGK(ax);
                ta.Value = {'DNF: x1 ∨ x2','KNF: (x1 ∧ ¬x2) ∨ x2'};
            case 'UK - Unijska mreža'
                grafUK(ax);
                ta.Value = {'DNF: x1 ∨ x2','KNF: (x1 ∨ x2)'};
            case 'TK - Topološka mreža'
                grafTK(ax);
                ta.Value = {'DNF: (x1 ∧ x2) ∨ x3','KNF: (x1 ∨ x3) ∧ x2'};
            case 'HK - Horizontalno-vertikalna'
                grafHK(ax);
                ta.Value = {'DNF: (x1 ∧ ¬x2)','KNF: (x1 ∨ x2) ∧ x2'};
            case 'BK - Booleova mreža'
                grafBK(ax);
                ta.Value = {'DNF: x1 ∨ (x2 ∧ ¬x3)','KNF: (x1 ∨ x2) ∧ (¬x1 ∨ x3)'};
        end
    end

    function prikaziTablice(ta)
        ta.Value = {
            'a | b | a∨b | a∧b | ¬a'
            '0 | 0 |  0  |  0  | 1'
            '0 | 1 |  1  |  0  | 1'
            '1 | 0 |  1  |  0  | 0'
            '1 | 1 |  1  |  1  | 0'
            };
    end

    function exportujPDF()
        msgbox('Spremanje PDF-a nije još uključeno. Dodati dom funkciju.');
    end

    % Definicije mreža
    function grafGK(ax)
        G = graph([1 2 3],[2 3 1]);
        plot(ax, G);
    end

    function grafUK(ax)
        G = graph([1 1 2],[2 3 3]);
        plot(ax, G);
    end

    function grafTK(ax)
        G = digraph([1 2 3],[2 3 1]);
        plot(ax, G);
    end

    function grafHK(ax)
        G = graph([1 2 3 4],[2 3 4 1]);
        plot(ax, G);
    end

    function grafBK(ax)
        G = graph([1 1 2 3],[2 3 3 4]);
        plot(ax, G);
    end
end

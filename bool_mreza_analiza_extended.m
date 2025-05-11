
function bool_mreza_analiza()
    % Boolove mreze: Gk, Uk, Tk, Hk, Bk s grafickim prikazom
    figure;
    subplot(2,3,1); % Gk mreža
    Gk = graph([1 1 2 3],[2 3 4 4]);
    plot(Gk); title('Gk: Generalizovana mreža');

    subplot(2,3,2); % Uk mreža
    Uk = graph([1 2 3],[2 3 4]);
    plot(Uk); title('Uk: Unijska mreža');

    subplot(2,3,3); % Tk mreža
    Tk = digraph([1 2 3],[2 3 4]);
    plot(Tk); title('Tk: Topološka mreža');

    subplot(2,3,4); % Hk mreža
    Hk = graph([1 1 2 3],[2 3 4 4]);
    plot(Hk,'Layout','force'); title('Hk: Horizontalno-vertikalna mreža');

    subplot(2,3,5); % Bk mreža
    Bk = digraph([1 2 3 4],[2 3 4 1]);
    plot(Bk); title('Bk: Booleova mreža');

    % Spasi sliku na Desktop
    folder = fullfile(getenv('USERPROFILE'), 'Desktop');
    saveas(gcf, fullfile(folder, 'boolove_mreze_grafovi.jpg'));

    % Unos funkcije korisnika
    prompt = 'Unesi Booleovu funkciju u terminima a i b (npr. a|~b): ';
    expr = input(prompt,'s');
    
    % Generisanje istinitosne tabele
    fprintf('\nIstinitosna tabela za funkciju: %s\n', expr);
    fprintf(' a | b | f(a,b)\n');
    fprintf('---|---|--------\n');
    for a = 0:1
        for b = 0:1
            f = eval(strrep(strrep(expr, 'a', num2str(a)), 'b', num2str(b)));
            fprintf(' %d | %d |   %d\n', a, b, f);
        end
    end

    % DNF i KNF (približno - simbolički)
    fprintf('\nPribližna DNF: (a & ~b) | (a & b) | (~a & b)\n');
    fprintf('Približna KNF: (a | b) & (~a | b) & (a | ~b)\n');

    % Snimi izvještaj u tekstualni fajl
    fileID = fopen(fullfile(folder, 'boolova_analiza.txt'),'w');
    fprintf(fileID, 'Analiza funkcije: %s\n', expr);
    fprintf(fileID, ' a | b | f(a,b)\n');
    fprintf(fileID, '---|---|--------\n');
    for a = 0:1
        for b = 0:1
            f = eval(strrep(strrep(expr, 'a', num2str(a)), 'b', num2str(b)));
            fprintf(fileID, ' %d | %d |   %d\n', a, b, f);
        end
    end
    fprintf(fileID, '\nPribližna DNF: (a & ~b) | (a & b) | (~a & b)\n');
    fprintf(fileID, 'Približna KNF: (a | b) & (~a | b) & (a | ~b)\n');
    fclose(fileID);
    disp('Grafovi i analiza su spremljeni na Desktop.');
end

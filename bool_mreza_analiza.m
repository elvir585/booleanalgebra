
function bool_mreza_analiza()
    figure('Name','Analiza mreža pomoću Booleove algebre','NumberTitle','off');

    % Gk mreža – Generalna mreža (bez striktne strukture)
    subplot(2,3,1);
    G1 = graph([1 2 3],[2 3 4]);
    plot(G1);
    title('Gk - Generalna mreža');

    % Uk mreža – Unijska mreža (zatvorena na OR)
    subplot(2,3,2);
    G2 = graph([1 2 2],[2 3 4]);
    plot(G2);
    title('Uk - Unijska mreža');

    % Tk mreža – Topološka mreža (djelimična veza)
    subplot(2,3,3);
    G3 = digraph([1 2 3],[2 4 4]);
    plot(G3);
    title('Tk - Topološka mreža');

    % Hk mreža – Horizontalno-vertikalna
    subplot(2,3,4);
    s = [1 1 2 3 4]; t = [2 3 4 5 5];
    G4 = graph(s,t);
    plot(G4);
    title('Hk - Horizontalno-vertikalna mreža');

    % Bk mreža – Booleova (kompletna struktura)
    subplot(2,3,5);
    G5 = digraph([1 2 3 4 5 6],[2 3 4 5 6 1]);
    plot(G5);
    title('Bk - Booleova mreža');

    % Objašnjenje logike
    sgtitle('Logička interpretacija: 0 = spajanje (OR), 1 = sjecište (AND)');
end

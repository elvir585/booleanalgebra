function boolove_mreze_extended_GUI()
    figure('Name','Vizualizacija mreža','NumberTitle','off');

    % --- Gk: Generalizovana mreža ---
    subplot(2,3,1);
    plot([0,1],[0,1],'k',[1,2],[1,2],'k');
    hold on; scatter([0 1 2],[0 1 2],'filled');
    title('G_k - Generalizovana mreža');
    grid on;

    % --- Uk: Unijska mreža ---
    subplot(2,3,2);
    plot([0,1],[0,0],'g',[1,2],[0,0],'g');
    hold on; scatter([0 1 2],[0 0 0],'filled');
    title('U_k - Unijska mreža');
    grid on;

    % --- Tk: Topološka mreža ---
    subplot(2,3,3);
    plot([0,1,2],[1,0,1],'r');
    hold on; scatter([0 1 2],[1 0 1],'filled');
    title('T_k - Topološka mreža');
    grid on;

    % --- Hk: Horizontalno-vertikalna mreža ---
    subplot(2,3,4);
    plot([0,2],[1,1],'b',[1,1],[0,2],'b');
    hold on; scatter([0 1 2],[1 1 1],'filled');
    scatter([1],[0 2],'filled');
    title('H_k - Hor.-Vert. mreža');
    grid on;

    % --- Bk: Booleova mreža ---
    subplot(2,3,5);
    plot([0,1],[0,1],'m',[1,2],[1,0],'m',[0,2],[0,0],'m');
    hold on; scatter([0 1 2],[0 1 0],'filled');
    title('B_k - Booleova mreža');
    grid on;

    % --- Prazno polje ---
    subplot(2,3,6);
    axis off;

    sgtitle('Prikaz mreža: G_k, U_k, T_k, H_k, B_k');
end

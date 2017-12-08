clear all
close all
clc
nomDossier = ('Pages_txt');
%cd(nomDossier);
extension = 'txt';
listDeFichier = dir([nomDossier,'/*',extension]);
nombreFichier = length(listDeFichier);
%prefix = 'pointeurvers:';
%fid= fopen('Pages_txt/p1.txt','r');
%ligne = fgetl(fid);
for initialFichier = 1:nombreFichier
    %matrice = zeros(nombreFichier,1);
    %disp(['traitement fichier n°',sprintf('%d',initialFichier,'%s',nombreFichier)]);
    nomDeFichier = listDeFichier(initialFichier).name;
    fprintf('traitement fichier %s\n', nomDeFichier);
    %fprintf('%s',nomDeFichier);
    %text = fileread(nomDeFichier);
    %fid = fopen('Pages_txt/p1.txt','r');
    fid = fopen('nomDeFichier','r');
        if fid == -1
          error('Author:Function:OpenFile', 'Cannot open file: %s',nomDeFichier);
        end

    %ligne = fgetl(fid);
    %length(ligne);
    %fprintf(ligne);
    fclose(fid);
    %for chercherLesPointeur = 1:nombreFichier
end
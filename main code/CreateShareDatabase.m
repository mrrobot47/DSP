function [ListOfImageNames] = CreateShareDatabase()
folder = 'C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\*.s2*';
ListOfImageNames = {};
ImageFiles = dir(folder);
    for Index = 1:50%length(ImageFiles)
        baseFileName = ImageFiles(Index).name;
        [folder, name, extension] = fileparts(baseFileName);
        extension = upper(extension);
        % Let's save just those we are interested in:
        strName = strcat('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\',baseFileName);
        switch lower(extension)
        case {'.dat'}
            % Allow only PNG, TIF, JPG, or BMP images
            ListOfImageNames = [ListOfImageNames strName];
        otherwise
        end
    end
    ListOfImageNames = sort_nat(ListOfImageNames);
end
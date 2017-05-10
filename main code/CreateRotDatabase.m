function [ListOfImageNames] = CreateRotDatabase()
folder = 'D:\DSP\Fingerprint-recognition-system nigamaript\db\db\*.rot*';
ListOfImageNames = {};
ImageFiles = dir(folder);
    for Index = 1:length(ImageFiles)
        baseFileName = ImageFiles(Index).name;
        [folder, name, extension] = fileparts(baseFileName);
        extension = upper(extension);
        % Let's save just those we are interested in:
        switch lower(extension)
        case {'.dat'}
            % Allow only PNG, TIF, JPG, or BMP images
            ListOfImageNames = [ListOfImageNames baseFileName];
        otherwise
        end
    end
    ListOfImageNames = sort_nat(ListOfImageNames);
end
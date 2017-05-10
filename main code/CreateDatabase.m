function [ListOfImageNames] = CreateDatabase()
folder = 'D:\dsp\org\*.tif.dat';
ListOfImageNames = {};
ImageFiles = dir(folder);
    for Index = 1:25%length(ImageFiles)
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